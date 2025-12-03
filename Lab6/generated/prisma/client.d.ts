import * as runtime from "@prisma/client/runtime/library";
import * as $Class from "./internal/class.js";
import * as Prisma from "./internal/prismaNamespace.js";
export * as $Enums from './enums.js';
export * from "./enums.js";
/**
 * ## Prisma Client
 *
 * Type-safe database client for TypeScript
 * @example
 * ```
 * const prisma = new PrismaClient()
 * // Fetch zero or more Achievements
 * const achievements = await prisma.achievements.findMany()
 * ```
 *
 * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
 */
export declare const PrismaClient: $Class.PrismaClientConstructor;
export type PrismaClient<LogOpts extends Prisma.LogLevel = never, OmitOpts extends Prisma.PrismaClientOptions["omit"] = Prisma.PrismaClientOptions["omit"], ExtArgs extends runtime.Types.Extensions.InternalArgs = runtime.Types.Extensions.DefaultArgs> = $Class.PrismaClient<LogOpts, OmitOpts, ExtArgs>;
export { Prisma };
/**
 * Model achievements
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type achievements = Prisma.achievementsModel;
/**
 * Model devs
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type devs = Prisma.devsModel;
/**
 * Model events
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type events = Prisma.eventsModel;
/**
 * Model friends
 *
 */
export type friends = Prisma.friendsModel;
/**
 * Model game_dev_connection
 *
 */
export type game_dev_connection = Prisma.game_dev_connectionModel;
/**
 * Model game_news
 *
 */
export type game_news = Prisma.game_newsModel;
/**
 * Model game_tag_connection
 *
 */
export type game_tag_connection = Prisma.game_tag_connectionModel;
/**
 * Model games
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type games = Prisma.gamesModel;
/**
 * Model libraries
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type libraries = Prisma.librariesModel;
/**
 * Model reviews
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type reviews = Prisma.reviewsModel;
/**
 * Model saves
 *
 */
export type saves = Prisma.savesModel;
/**
 * Model tags
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type tags = Prisma.tagsModel;
/**
 * Model user_achieve_connection
 *
 */
export type user_achieve_connection = Prisma.user_achieve_connectionModel;
/**
 * Model users
 * This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
 */
export type users = Prisma.usersModel;
//# sourceMappingURL=client.d.ts.map