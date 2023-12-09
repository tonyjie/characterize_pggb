import matplotlib.pyplot as plt

# Data
# num_threads
x = [1, 2, 4, 8, 16, 32]
# run time
y = [3200, 1600, 1100, 552, 283, 152] 

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
yticks = [100, 200, 400, 800, 1600, 3200]
plt.yticks(yticks, yticks)

# Adding grid for better readability
plt.grid(True)

# Showing the plot
plt.tight_layout()
plt.savefig("wfmash_scale_ecoli.pdf")