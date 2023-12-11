import matplotlib.pyplot as plt

FONTSIZE=25
# set larger fontsize
plt.rcParams.update({'font.size': FONTSIZE})

# Data
# num_threads
x = [4, 8, 16, 32]
# run time in minutes: [31m0.409s, 30m22.591s, 30m34.972s, 30m2.589s]
y = [31+0.409/60, 30+22.591/60, 30+34.972/60, 30+2.589/60] # in minutes

# Creating the plot
plt.style.use('ggplot')  # Using a fancy style for the plot
plt.figure(figsize=(10, 6))  # Setting the figure size

plt.loglog(x, y, marker='o', color='red', linestyle='-', linewidth=2, markersize=8)  # Line plot with markers

# Adding titles and labels
plt.xlabel("Number of Threads (#)", fontsize=FONTSIZE)
plt.ylabel("Run Time (minutes)", fontsize=FONTSIZE)

from matplotlib.ticker import NullLocator
# Disable automatic minor ticks
plt.gca().xaxis.set_minor_locator(NullLocator())
plt.gca().yaxis.set_minor_locator(NullLocator())

# large font for ticks and labels
plt.tick_params(axis='both', which='major', labelsize=FONTSIZE)
plt.tick_params(axis='both', which='minor', labelsize=FONTSIZE)

# Fix the xticks
plt.xticks(x, x)
# Fix the yticks
yticks = [30, 30.5, 31, 31.5]
plt.yticks(yticks, yticks)

# Adding grid for better readability
plt.grid(True)

# Showing the plot
plt.tight_layout()
plt.savefig("smoothxg_scale_scerevisiae8.pdf")