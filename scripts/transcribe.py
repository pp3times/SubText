import os
import openai
import sys
openai.api_key = os.getenv("OPENAI_API_KEY")
video_id = sys.argv[1]
audio_file_path = os.path.join(os.getcwd(), 'tmp', video_id + '.m4a')

audio_file = open(audio_file_path, "rb")
transcript = openai.Audio.transcribe(
    file=audio_file,
    model="whisper-1",
    response_format='srt',
    prompt=(
        'I am a programmer. My name is Thanawat. '
        'This is a vlog about everything I do or I am interested in. '
        'I want to share a knowledge and experience with everyone. '
    )
)
print(transcript)
