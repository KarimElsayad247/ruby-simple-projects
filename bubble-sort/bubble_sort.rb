def bubble_sort(arr)
    for i in (0...(arr.length - 1))
        for j in (0...arr.length - i - 1)
            if arr[j] > arr[j+1]
                arr[j+1], arr[j] = arr[j], arr[j+1]
            end
        end
    end
    return arr
end

test_arr = [4,3,78,2,0,2]
test_arr = [5,8,23562346,4,2,6,9,0,65,3,57,9,4325,7,43,55]
p bubble_sort(test_arr)