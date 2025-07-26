from tensorflow.keras.preprocessing.image import ImageDataGenerator

# Define the training directory
train_dir = r'D:\hackathon\crop\data\archive\New Plant Diseases Dataset(Augmented)\New Plant Diseases Dataset(Augmented)\train'

# Create an ImageDataGenerator
train_datagen = ImageDataGenerator(rescale=1./255)

# Create a generator for the training data
train_generator = train_datagen.flow_from_directory(
    train_dir,
    target_size=(150, 150),
    batch_size=32,
    class_mode='categorical'
)

# Get the class labels
class_labels = list(train_generator.class_indices.keys())
print("Class Labels:", class_labels)