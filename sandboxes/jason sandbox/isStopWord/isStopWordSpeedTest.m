%Speed comparison between isStopWord functions implemented with:
    %1)cellArray
    %2)containers.map

n = 1000;

text = fileread('C:\Users\FLOW\Documents\Internships_Research\faridani-MatlabNLP-2e75adc\isStopWord\test.txt');
text = sanitizeComment(text);   %remove all but letters
text = lower(text);
text = regexp(text,' ','split'); %text now in cell array
%text = text(1:n);   %determine size of test text based on given n

testMap = containers.Map;
for i = 1:size(text,2)
    word = porterStemmer(cell2mat(text(i)));
    if isKey(testMap,word)
    else
        testMap(word) = word;
    end
end

testCellArray = keys(testMap);

tic;

mapOut = isStopWordMap('aura',testMap);

mapTime = toc;

tic;

caOut = isStopWord('aura',testCellArray);

caTime = toc;

fprintf('map implementation of isStopWord returns %d in %f\n',mapOut,mapTime)
fprintf('cell array implementation of isStopWord returns %d in %f\n',caOut,caTime)
