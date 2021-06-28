#include "conv2d.cuh"
#include "conv2d.cuh"
#include <vector>
#include <math.h>

int main() {



    const int size_row = 2;
    const int size_col = 2;

    std::vector<float> img((size_row) * (size_col));


//    for(int i = 1; i < (int) size_row-1; i++)
//    {
//        img[i + size_row * ((int)size_col/2)] = 1;
//    }
img[1] = 1;
    // e-1                   e-2  e-1  e-2
    //  1    x  e-1 1 e-1 =  e-1   1   e-1
    // e-1                   e-2  e-1  e-2

    float sum = 2*expf(-1) + 1;

    float conv_h[] = {expf(-1)/sum, (float)1.0/sum, expf(-1)/sum,// conv1
                      expf(-1)/sum, (float)1.0/sum, expf(-1)/sum};// conv2

    Conv2d conv(img, size_row, size_col, conv_h);
    cudaCheck(conv.Smooth(conv_h));
    img_t vec;
    cudaCheck(conv.AttachToHost(vec));
    return 0;
}
