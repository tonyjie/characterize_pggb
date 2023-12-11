# Description: Plot the thread scale of wfmash

import matplotlib.pyplot as plt

FONTSIZE=25
# set larger fontsize
plt.rcParams.update({'font.size': FONTSIZE})


# Data
# num_threads
x = [1, 2, 4, 8, 16, 32]

## ======= wfmash ========
# run time
# DRB1-3123 in seconds
y = [2.055, 1.638, 1.047, 1.128, 1.061, 1.062]

# Creating the plot
plt.style.use('ggplot')  # Using a fancy style for the plot
plt.figure(figsize=(10, 6))  # Setting the figure size

plt.loglog(x, y, marker='o', color='red', linestyle='-', linewidth=2, markersize=8)  # Line plot with markers

# large font for labels

# Adding titles and labels
plt.xlabel("Number of Threads (#)", fontsize=FONTSIZE)
plt.ylabel("Run Time (seconds)", fontsize=FONTSIZE)
# plt.ylabel("Run Time (minutes)", fontsize=FONTSIZE)

# large font for ticks and labels
plt.tick_params(axis='both', which='major', labelsize=FONTSIZE)
plt.tick_params(axis='both', which='minor', labelsize=FONTSIZE)


# Fix the xticks
plt.xticks(x, x)
# Fix the yticks: DRB1-3123
yticks = [1, 1.2, 1.4, 1.6, 1.8, 2.0]
plt.yticks(yticks, yticks)

# Adding grid for better readability
plt.grid(True)

# Showing the plot
plt.tight_layout()
plt.savefig("wfmash_scale_DRB1-3123.pdf")