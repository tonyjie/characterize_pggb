import matplotlib.pyplot as plt

FONTSIZE=25
# set larger fontsize
plt.rcParams.update({'font.size': FONTSIZE})

# Data
# num_threads
x = [1, 2, 4, 8, 16, 32]
# run time
y = [30, 30, 28.37, 24.603 , 24.267, 23.897 ] # the first two values [30] are fake...

# Creating the plot
plt.style.use('ggplot')  # Using a fancy style for the plot
plt.figure(figsize=(10, 6))  # Setting the figure size

plt.loglog(x, y, marker='o', color='red', linestyle='-', linewidth=2, markersize=8)  # Line plot with markers

# Adding titles and labels
plt.xlabel("Number of Threads (#)", fontsize=FONTSIZE)
plt.ylabel("Run Time (seconds)", fontsize=FONTSIZE)

# large font for ticks and labels
plt.tick_params(axis='both', which='major', labelsize=FONTSIZE)
plt.tick_params(axis='both', which='minor', labelsize=FONTSIZE)

# Fix the xticks
plt.xticks(x, x)
# Fix the yticks
yticks = [20, 22, 24, 26,28,30]
plt.yticks(yticks, yticks)

# Adding grid for better readability
plt.grid(True)

# Showing the plot
plt.tight_layout()
plt.savefig("seqwish_scale_scerevisiae8.pdf")