import h5py
from tqdm import tqdm


def main():

    filename = 'MSVD_InceptionV4.hdf5'

    with h5py.File(filename, 'r') as f:
        # List all groups
        f1 = open("msvd_inceptionv4_train.txt", 'w')
        f2 = open("msvd_inceptionv4_val.txt", 'w')
        f3 = open("msvd_inceptionv4_test.txt", 'w')

        for vid, c in tqdm(enumerate(f.keys())):
            # train
            if vid < 1200:
                if vid == 0:
                    print "train write ready....\n"

                for frame, feat in enumerate(f[c]):
                    d1 = "vid%d_frame_%d," % (vid + 1, frame + 1)
                    d2 = ','.join(map(str, feat))
                    data = d1 + d2 + '\n'
                    f1.write(data)

                if vid == 1199:
                    print "train write success....\n"

            # val
            elif vid < 1300:
                if vid == 1200:
                    print "val write ready....\n"

                for frame, feat in enumerate(f[c]):
                    d1 = "vid%d_frame_%d," % (vid + 1, frame + 1)
                    d2 = ','.join(map(str, feat))
                    data = d1 + d2 + '\n'
                    f2.write(data)

                if vid == 1299:
                    print "val write success....\n"

            # test
            else:
                if vid == 1300:
                    print "test write ready....\n"

                for frame, feat in enumerate(f[c]):
                    d1 = "vid%d_frame_%d," % (vid + 1, frame + 1)
                    d2 = ','.join(map(str, feat))
                    data = d1 + d2 + '\n'
                    f3.write(data)

                if vid == 1969:
                    print "test write success....\n"

        f1.close()
        f2.close()
        f3.close()

if __name__ == "__main__":
    main()
