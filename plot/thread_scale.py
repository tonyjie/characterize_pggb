import matplotlib.pyplot as plt

# Data
# num_threads
x = [1, 2, 4, 8, 16, 32]

## ======= wfmash ========
# run time
# DRB1-3123 in seconds
y = [2.055, 1.638, 1.047, 1.128, 1.061, 1.062]

# ecoli-50 in minutes
# [209m4.639s, 106m47.432s, 55m20.311s, 27m41.845s, 14m1.900s, 7m19.374s]
# y = [209.1, 106.8, 55.3, 27.7, 14.0, 7.3]


# y = [3200, 2113, 1100, 552, 283, 152] # threads=1 not set yet.  

# Creating the plot
plt.style.use('ggplot')  # Using a fancy style for the plot
plt.figure(figsize=(10, 6))  # Setting the figure size

plt.loglog(x, y, marker='o', color='red', linestyle='-', linewidth=2, markersize=8)  # Line plot with markers

# Adding titles and labels
plt.xlabel("Number of Threads (#)")
plt.ylabel("Run Time (seconds)")
# plt.ylabel("Run Time (minutes)")

# Fix the xticks
plt.xticks(x, x)
# Fix the yticks
# yticks = [100, 200, 400, 800, 1600, 3200]
# plt.yticks(yticks, yticks)

# Adding grid for better readability
plt.grid(True)

# Showing the plot
plt.tight_layout()
plt.savefig("wfmash_scale_DRB1-3123.pdf")
# plt.savefig("wfmash_scale_ecoli50.pdf")