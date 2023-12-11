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



# ecoli-50 in minutes
# [209m4.639s, 106m47.432s, 55m20.311s, 27m41.845s, 14m1.900s, 7m19.374s]
y = [209.1, 106.8, 55.3, 27.7, 14.0, 7.3]



# Creating the plot
plt.style.use('ggplot')  # Using a fancy style for the plot
plt.figure(figsize=(10, 6))  # Setting the figure size

plt.loglog(x, y, marker='o', color='red', linestyle='-', linewidth=2, markersize=8)  # Line plot with markers

# large font for labels

# Adding titles and labels
plt.xlabel("Number of Threads (#)", fontsize=FONTSIZE)
plt.ylabel("Run Time (minutes)", fontsize=FONTSIZE)

# large font for ticks and labels
plt.tick_params(axis='both', which='major', labelsize=FONTSIZE)
plt.tick_params(axis='both', which='minor', labelsize=FONTSIZE)


# Fix the xticks
plt.xticks(x, x)

# Adding grid for better readability
plt.grid(True)

# Showing the plot
plt.tight_layout()
plt.savefig("wfmash_scale_ecoli50.pdf")