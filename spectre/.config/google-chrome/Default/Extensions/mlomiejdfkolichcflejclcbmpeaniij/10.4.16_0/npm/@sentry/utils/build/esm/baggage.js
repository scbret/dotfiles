import { isString } from './is.js';

const SENTRY_BAGGAGE_KEY_PREFIX = 'sentry-';

const SENTRY_BAGGAGE_KEY_PREFIX_REGEX = /^sentry-/;

/**
 * Takes a baggage header and turns it into Dynamic Sampling Context, by extracting all the "sentry-" prefixed values
 * from it.
 *
 * @param baggageHeader A very bread definition of a baggage header as it might appear in various frameworks.
 * @returns The Dynamic Sampling Context that was found on `baggageHeader`, if there was any, `undefined` otherwise.
 */
function baggageHeaderToDynamicSamplingContext(
  // Very liberal definition of what any incoming header might look like
  baggageHeader,
) {
  const baggageObject = parseBaggageHeader(baggageHeader);

  if (!baggageObject) {
    return undefined;
  }

  // Read all "sentry-" prefixed values out of the baggage object and put it onto a dynamic sampling context object.
  const dynamicSamplingContext = Object.entries(baggageObject).reduce((acc, [key, value]) => {
    if (key.match(SENTRY_BAGGAGE_KEY_PREFIX_REGEX)) {
      const nonPrefixedKey = key.slice(SENTRY_BAGGAGE_KEY_PREFIX.length);
      acc[nonPrefixedKey] = value;
    }
    return acc;
  }, {});

  // Only return a dynamic sampling context object if there are keys in it.
  // A keyless object means there were no sentry values on the header, which means that there is no DSC.
  if (Object.keys(dynamicSamplingContext).length > 0) {
    return dynamicSamplingContext ;
  } else {
    return undefined;
  }
}

/**
 * Take a baggage header and parse it into an object.
 */
function parseBaggageHeader(
  baggageHeader,
) {
  if (!baggageHeader || (!isString(baggageHeader) && !Array.isArray(baggageHeader))) {
    return undefined;
  }

  if (Array.isArray(baggageHeader)) {
    // Combine all baggage headers into one object containing the baggage values so we can later read the Sentry-DSC-values from it
    return baggageHeader.reduce((acc, curr) => {
      const currBaggageObject = baggageHeaderToObject(curr);
      Object.entries(currBaggageObject).forEach(([key, value]) => {
        acc[key] = value;
      });
      return acc;
    }, {});
  }

  return baggageHeaderToObject(baggageHeader);
}

/**
 * Will parse a baggage header, which is a simple key-value map, into a flat object.
 *
 * @param baggageHeader The baggage header to parse.
 * @returns a flat object containing all the key-value pairs from `baggageHeader`.
 */
function baggageHeaderToObject(baggageHeader) {
  return baggageHeader
    .split(',')
    .map(baggageEntry => baggageEntry.split('=').map(keyOrValue => decodeURIComponent(keyOrValue.trim())))
    .reduce((acc, [key, value]) => {
      if (key && value) {
        acc[key] = value;
      }
      return acc;
    }, {});
}

export { SENTRY_BAGGAGE_KEY_PREFIX, SENTRY_BAGGAGE_KEY_PREFIX_REGEX, baggageHeaderToDynamicSamplingContext, parseBaggageHeader };
