def zip(*array)
    ans = Hash.new
    fla = array.flatten

    (1..fla.length).each do |i|
        if ans[i% (fla.length/array.length)] == nil
            ans[i% (fla.length/array.length)] = [fla[i-1]]
        else
            ans[i% (fla.length/array.length)] << fla[i-1]
        end
    end

    ans.values
end

def prizz_proc(array, p1, p2)
    ans = []
    array.each do |ele|
        if (p1.call(ele) && !p2.call(ele)) || (!p1.call(ele) && p2.call(ele))
            ans << ele
        end
    end
    ans
end

def zany_zip(*array)
    ans = Hash.new

    len = array.length
    largest = 0
    array.each do |subarr|
        if subarr.length > largest
            largest = subarr.length
        end
    end

    array.each do |subarr|
        while subarr.length < largest
            subarr << nil
        end
    end

    fla = array.flatten

    (1..fla.length).each do |i|
        if ans[i% (fla.length/array.length)] == nil
            ans[i% (fla.length/array.length)] = [fla[i-1]]
        else
            ans[i% (fla.length/array.length)] << fla[i-1]
        end
    end

    ans.values
end

def maximum(array, &proc)
    if array.length == 0
        return nil
    end

    ans = proc.call(array[0])
    val = array[0]
    array.each do |ele|
        temp = proc.call(ele)
        if temp >= ans
            ans = temp
            val = ele
        end
    end
    val
end

def my_group_by(array, &proc)
    ans = Hash.new

    array.each do |ele|
        key = proc.call(ele)
        if ans[key] == nil
            ans[key] = [ele]
        else
            ans[key] << ele
        end
    end
    ans
end

def max_tie_breaker(array, p1, &proc)
    if array.length == 0
        return nil
    end

    ans = p1.call(array[0])
    val = array[0]
    array.each do |ele|
        temp = p1.call(ele)
        if temp > ans
            ans = temp
            val = ele
        end
    end

    pans = proc.call(array[0])
    pval = array[0]
    array.each do |ele|
        ptemp = proc.call(ele)
        if ptemp > pans
            pans = ptemp
            pval = ele
        end
    end

    if val == pval
        return val
    else 
        return pval
    end
end

def silly_syllables(sentence)
    new_sentence = []
    arr = sentence.split(" ")
    vowels = "aeiouAEIOU"
    
    arr.each do |word|
        if count_vowels(word) >= 2
            first = first_vowels(word)
            last = last_vowels(word)

            temp = word[first..last]
            new_sentence << temp
        else
            new_sentence << word
        end
    end
    new_sentence.join(" ")
end

def count_vowels(word)
    count = 0
    vowels = "aeiouAEIOU"
    (0...word.length).each do |i|
        if vowels.include?(word[i])
            count += 1
        end
    end
    count
end

def first_vowels(word)
    vowels = "aeiouAEIOU"
    (0...word.length).each do |i|
        if vowels.include?(word[i])
            return i
        end
    end
end

def last_vowels(word)
    vowels = "aeiouAEIOU"
    (1...word.length).each do |i|
        if vowels.include?(word[-i])
            return -i
        end
    end
end