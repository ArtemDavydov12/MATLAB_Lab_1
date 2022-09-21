%% Creating pitches;
pitchDur = 1;
fS = 8000;
timeArray = 0:1/fS:pitchDur;
pitchB = sin(2*pi*freqPitch(1)*timeArray);
pitchA = sin(2*pi*freqPitch(2)*timeArray);
pitchG = sin(2*pi*freqPitch(3)*timeArray);
pitchF = sin(2*pi*freqPitch(4)*timeArray);
pitchE = sin(2*pi*freqPitch(5)*timeArray);
pitchD = sin(2*pi*freqPitch(6)*timeArray);
pitchC = sin(2*pi*freqPitch(7)*timeArray);

%% Read the file with pitches;
fileID = fopen('song.txt', 'r');
song = fscanf(fileID,'%s');
whos("song")

%% Create the song and the file,wav;
singSong = [pitchF pitchC pitchF pitchC pitchF pitchE pitchE pitchE pitchC pitchE pitchC pitchE pitchF pitchF pitchF pitchC pitchF pitchC pitchF pitchE pitchE pitchE pitchC pitchE pitchC pitchF];
sound(singSong);
audiowrite("firstSong.wav", singSong, fS);
audioWavInfo = audioinfo("firstSong.wav");
wavFileName = audioWavInfo.Filename;
wavFileCompMet = audioWavInfo.CompressionMethod;
wavFileNumCh = audioWavInfo.NumChannels;
wavFileRate = audioWavInfo.SampleRate;
wavFileSamples = audioWavInfo.TotalSamples;
wavFileDur = audioWavInfo.Duration;

%% Listen the mp3 file;
open song.mp3
[y,fs] = audioread('song.mp3');
sound(y,fs);
audioMp3Info = audioinfo("song.mp3");
mp3FileName = audioMp3Info.Filename;
mp3FileCompMet = audioMp3Info.CompressionMethod;
mp3FileNumCh = audioMp3Info.NumChannels;
mp3FileRate = audioMp3Info.SampleRate;
mp3FileSamples = audioMp3Info.TotalSamples;
mp3FileDur = audioMp3Info.Duration;
save ('data.mat', 'mp3FileDur',"mp3FileSamples","mp3FileRate","mp3FileNumCh","mp3FileCompMet","mp3FileName");

%% fPrintf Command Window;
fprintf('---------- .MP3 VS .WAV ----------\n');

fprintf(blanks(5));
[filepath, name, ext] = fileparts(wavFileName);
fprintf('%s', name,ext, blanks(1));
fprintf('%s', 'VS', blanks(1));
[filepath1, name1, ext1] = fileparts(mp3FileName);
fprintf('%s', name1,ext1);
fprintf('\n');

fprintf(blanks(8))
fprintf('%s', wavFileCompMet, blanks(1));
fprintf('%s', 'VS', blanks(1));
fprintf('%s', mp3FileCompMet);
fprintf('\n');

fprintf(blanks(9))
fprintf('% .2f', wavFileDur);
fprintf(blanks(1));
fprintf('%s', 'VS');
fprintf('% 1.2f', mp3FileDur);
fprintf('\n');

fprintf(blanks(5))
fprintf('% .2f', wavFileSamples);
fprintf(blanks(1));
fprintf('%s', 'VS');
fprintf('% 1.2f', mp3FileSamples);
fprintf('\n');
fprintf('----------------------------------\n');

