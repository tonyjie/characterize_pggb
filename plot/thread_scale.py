import matplotlib.pyplot as plt

# Data
# num_threads
x = [1, 2, 4, 8, 16, 32]
# run time
# DRB1-3123 in seconds
y = [2.063, 1.545, 1.049, 1.057, 1.071, 1.075]


# y = [3200, 2113, 1100, 552, 283, 152] # threads=1 not set yet.  

# Creating the plot
plt.style.use('ggplot')  # Using a fancy style for the plot
plt.figure(figsize=(10, 6))  # Setting the figure size

plt.loglog(x, y, marker='o', color='red', linestyle='-', linewidth=2, markersize=8)  # Line plot with markers

# Adding titles and labels
plt.xlabel("Number of Threads (#)")
plt.ylabel("Run Time (seconds)")

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