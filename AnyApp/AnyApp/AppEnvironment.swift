import Foundation
import MyClientSDK

public class AppEnvironment: ObservableObject {
    public let storage: StorageClient
    #if USE_DATASTORE
    public let dataStore: DataStoreClient
    #endif

    public init() {
        storage = StorageClient()
        storage.uploadFile()
        storage.downloadFile()
        storage.fetchList()
        storage.removeFile()

        #if USE_DATASTORE
        dataStore = DataStoreClient()
        dataStore.syncData()
        dataStore.addObject()
        dataStore.removeObject()
        #endif
    }

}
