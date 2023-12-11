import matplotlib.pyplot as plt

fig, axs = plt.subplots(1, 3)

labels = {
    'DRB1-3123' : ['Retiring', 'Front-End Bound', 'Bad Speculation', 'Memory Bound', 'Core Bound'],
    'scerevisiae8' : ['Retiring', 'Front-End Bound', 'Bad Speculation', 'Memory Bound', 'Core Bound'],
    'ecoli50' : ['Retiring', 'Front-End Bound', 'Bad Speculation', 'Memory Bound', 'Core Bound'],
}

# for wfmash results profiled by VTune
data = {
    'DRB1-3123' : [30.8, 21.2, 8.2, 8.3, 31.5],
    'scerevisiae8' : [48.5, 23.0, 11.1, 5.7, 11.7],
    'ecoli50' : [42.9, 20.7, 11.9, 9.1, 15.4]
}

colors = ['seagreen', 'purple', 'salmon', 'navy', 'orange']

percent = {k:[round(v / sum(vs) * 100, 2) for v in vs] for k, vs in data.items()}

global_style = {
    'startangle'  : 140,
    'textprops'   : {'fontsize': 22},
    'pctdistance' : 0.5,
}

# function for labeling the percentage
def pct(value, label):
    return f'{value:1.1f}%' if label == 'Memory\n Bound' else ''

# Create a three pie charts (in three individual pdfs)
for bs in labels.keys():
    fig, ax = plt.subplots(1, 1)
    wedges, texts, autotexts = ax.pie(
        data[bs], labels=labels[bs],
        labeldistance=1.05,
        colors= colors,
        hatch = None,
        autopct = lambda p: pct(p, labels[bs][percent[bs].index(round(p, 2))]),
        **global_style
    )
    for w in wedges:
        w.set_alpha(0.99)
    for t in autotexts:
        t.set_fontweight('bold')
    for t in texts:
        t.set_fontweight('bold')

    plt.setp(autotexts, color='w', size=28)
    plt.tight_layout()
    plt.savefig(f'wfmash_microarch_{bs}.pdf', dpi=300, bbox_inches='tight')