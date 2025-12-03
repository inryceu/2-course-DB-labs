export declare const dev_type: {
    readonly developer: "developer";
    readonly publisher: "publisher";
    readonly both: "both";
};
export type dev_type = (typeof dev_type)[keyof typeof dev_type];
export declare const download_type: {
    readonly installed: "installed";
    readonly not_installed: "not_installed";
    readonly in_progress: "in_progress";
};
export type download_type = (typeof download_type)[keyof typeof download_type];
export declare const ev_type: {
    readonly sale: "sale";
    readonly giveaway: "giveaway";
    readonly free_weekend: "free_weekend";
};
export type ev_type = (typeof ev_type)[keyof typeof ev_type];
export declare const fr_status: {
    readonly pending: "pending";
    readonly accepted: "accepted";
    readonly blocked: "blocked";
};
export type fr_status = (typeof fr_status)[keyof typeof fr_status];
export declare const own_type: {
    readonly rented: "rented";
    readonly wishlist: "wishlist";
    readonly purchased: "purchased";
};
export type own_type = (typeof own_type)[keyof typeof own_type];
//# sourceMappingURL=enums.d.ts.map