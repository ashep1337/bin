import matplotlib.pyplot as plt

# Read data
with open('/tmp/cputemp.txt') as f:
    temps = [float(line.strip()) for line in f if line.strip()]

# Create X values: just 0,1,2,...
times = list(range(len(temps)))

# Plot
plt.figure(figsize=(8, 4))
plt.plot(times, temps, marker='o', color='purple', label='CPU Temp')
plt.title('CPU Temperature Over Time')
plt.xlabel('Sample number')
plt.ylabel('Temperature (°C)')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

