clear,clc;
sum = 0;
for index = 1:8
    cost = input('Enter a cost: ');
    if cost>100
        cost = cost*0.9;
    end
    sum = sum + cost;
end
fprintf('Total cost: %.2f\n', sum);