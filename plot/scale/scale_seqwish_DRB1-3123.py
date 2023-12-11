import matplotlib.pyplot as plt

FONTSIZE=25
# set larger fontsize
plt.rcParams.update({'font.size': FONTSIZE})

# Data
# num_threads
x = [1, 2, 4, 8, 16, 32]
# run time
y = [0.28, 0.334, 0.294, 0.269, 0.312, 0.324] 

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
yticks = [0.2, 0.3, 0.4]
plt.yticks(yticks, yticks)

# Adding grid for better readability
plt.grid(True)

# Showing the plot
plt.tight_layout()
plt.savefig("seqwish_scale_DRB1-3123.pdf")