# To genearte the end-to-end run time breakdown pie chart

import matplotlib.pyplot as plt

FONTSIZE=20
plt.rcParams.update({'font.size': FONTSIZE})

# Data
labels = ['wfmash', 'seqwish', 'smoothxg', 'odgi-layout', 'other']

# DRB1-3123 (sec)
# runtimes = [2.5, 1.6, 29.2, 4, 2.4 + 4]  # Summing up the last value
# scerevisiae8 (sec)
# runtimes = [54.2, 28.3, 9*60+8, 1*60+43, 30]
# ecoli-50 (min)
runtimes = [68, 3, 55, 26, 4]


# Creating the pie chart
plt.figure(figsize=(6, 6))
plt.pie(runtimes, labels=labels, autopct=lambda p: f'{p * sum(runtimes) / 100:.1f} min', startangle=140, colors=plt.cm.Paired.colors)

# Adding a legend
# plt.legend(labels, title="Stage", loc="best", bbox_to_anchor=(1, 0.5), fontsize=FONTSIZE)

# Adding title
# plt.title("Run Time Distribution of Tools", fontsize=FONTSIZE)

# Show the plot
plt.tight_layout()
# plt.savefig("e2e_breakdown_DRB1-3123.pdf")
# plt.savefig("e2e_breakdown_scerevisiae8.pdf")
plt.savefig("e2e_breakdown_ecoli50.pdf")

