Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780560;
	b=n19E0FdEEPbSjLY7gbYOSnfWnmW1kpHXG0Qo71bb5keVLzJB/wkHrMbNyLLC25CyyDGf
	 tH0trPmrfwhFRZTORlS2kuL6ZaPXK7/25YeRaZQmEMibim4oFDV8C91G33QGZzmH3nfE2
	 mazjPoIpU5IuWsN1xoT7PW9F0OCbc07l6dIe84vz9kvOPC4xD14xwrprdE5hO8iM+NjIL
	 cxZYkxy6Zblz6d13yCjp93jWm0bLQ5YPtabpHanaQwRWkAhqqM24xP8cwzU1OINZwx0XG
	 CVwrQG32LRURIJQrLzrruORfhss7vmePLEma4KBpotaUmI2UxDYmY3+x8p22DiU60HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
	b=Gq5NDJijPwPSvIrZylvp4ntIU55PyxnvpHvt3rcsOTwXt91+6Rwye+bR8FFGXgG7eRlS
	 8/IQVWYaKorQ6hdmduFYEj4ZgsdrT1CaUdvdcqIA0urdiubjp0cpyjZmrjgTC776/s5li
	 puEneIwvr+4+yur2+suUnCStblTfrOmXzKVXMAQiXrpQwFf2chxi45R09I1uEkDSurJjq
	 dE1pvUeBwgQ3aLT9MhyZxkPXOzlgO2R09Uy0FbuVbZrzWzGfe4928UaZla8kjdQmaRwVp
	 gBuKY3CVpKPoIy/qv1yrW5XQDBPSdN3ta0ZNRFVN2Jjpz2b7UAFAJfaWzCTAyifMh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=BPGsnnsA;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E7606A329
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 08:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7E7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=BPGsnnsA
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so166688f8f.2
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 00:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793780552; x=1794385352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
        b=BPGsnnsANdKFDBwS7jf1F7bvujXcyo7PkztdzZS9EbXkL+wNaCKDmjaqMuiq9Y2gDh
         IrLABEhJ7IKvvcdSSwT/nGD9u+le5ZGuWLd4FglI+z0dmC4GfTCuz3S8a45J9dsjIbuM
         8JoLX1/AC1GPVaSA9w+FDWLdz8cJ8caPaA410z7wFAgeCbhjuYiZBKpOpO1FAjjy1EC/
         O+2x6/uWrqshiVGtHPtT79y5YAnjhnFVefiVRKqpDFqlE7qkgx0LY1+VHafK7LPoU/83
         +Fsa4pkeDmCtw9tgZ707JUIPA6OnVwbdYmH6gJT9at2FB7v0dhjsU80YD4uBnNLHLrbD
         i4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780552; x=1794385352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
        b=mGIrD3TrM81mCpH8x4n1tSopfMPmMiNEr0mk1LzoRwcv9HYhy8ocf8ZlmM5u0CAPqI
         75VzWn6v2g0PC+waZOp1MIipS2Smhaxka5TJcnkPRi0ianRQpX/WY+4m8vbKt5PKFlQN
         HQEGe+Wh3CNku8FxM06k14bHQafbRVbl98E5+pTM2vvGTrfBaSPueJLur66SeBSOI2HK
         e7Ga1vfW87ea+KtP85/Gso/1SMas+ZnTr/613l4X8KCfM5Ewz7zzaIDKLSEgfsKUDPoI
         7F9iwn6p4iAHDFv5p6TBBzRXbVSBr0JBqfppWNmm8ZaM01mZxU5T5mWB9eoBzDvjM2v3
         igCw==
X-Gm-Message-State: APuU4Z/aqbanVUSWmTN5cSIBl08LjKE6WpkOFUkZlzHaLm7rEz82aE51
	aTBkUzCNNqnQNYqY9eSFVVurmbohIgpdAR4E/SFG+Lsrp04WMzYIBXnG37fcrejB4/E=
X-Gm-Gg: AYBFou0EF8/nRJOK3z3MuzbCSvBIH+nnqWFqHxZQJOAl+ow8ar79XbaaXcvllau9JNk
	tk/4BcmjyeoyuGec63LuG7C22A1LRYRSEoESd/ghEFVV9EfJtBxLmP0gD3+wb1HRBldwO5NPZP/
	wsjceasKppXTdlL4YLziyhQnDhyKtNTZ74S0v1u4CfZ8KsrLt9qbhj+ggk6dWRhzE3NsmPfm6Q3
	zwdF4m8hlFhQxUVruOgw+V/N6ieJgdMppm7jnJA78tyoxU5w471iepJka5xcNj13fkNbw9nQEwj
	UvRbkzVp8t218z5x6UeN+3ElGRR1LI2ENTD0zoewp70epSDm/YapbXYFXVrTknkHRyqJnyVYGcT
	YjQiqCVkjJCqyAOwAIYzJI6di29XUbMeZ0cFuFoC6XqSW2/dqmHowS8v4qhPMEPf2LxWxvyz5N6
	3a7YoifkjfyUWdeRGmJczLGOdUTLODnRGub1iRWQ+CSysPlXuiD6Av6F8F9el4iuaZnQ+DQ6Mos
	OapIlt1eacUOpRLMHoU9t6zIXZClC4pKLmgVBG0gMij2LOOpIVMM7dTGvsvNAwLJm60XxGWHI/8
	d/SggCbpidnfMgBOBbMozGKKDB/ee7OAROJU
X-Received: by 2002:a05:600c:3554:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ac18c7461emr379283885e9.35.1793780552290;
        Wed, 04 Nov 2026 00:22:32 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm2366556f8f.21.2026.11.04.00.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:22:31 -0800 (PST)
Date: Wed, 4 Nov 2026 09:22:26 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 15/20] attestation: Prepare provider and instance core
Message-ID: <aurpges1eUwSJUBE@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-16-jiri@resnulli.us>
 <auOVbGYJjIQTN53z@MjU3Nj>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auOVbGYJjIQTN53z@MjU3Nj>

Thu, Oct 29, 2026 at 07:50:20PM +0100, sergii.dmytruk@3mdeb.com wrote:
>On Thu, Oct 15, 2026 at 04:50:48PM +0200, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>

[..]

>> +/**
>> + * struct attestation_mr_props - Immutable MR properties.
>> + * @id: provider-unique MR ID
>> + * @name: MR name
>> + * @algorithms: ordered hash algorithms
>
>Why do these need to be sorted?  Is it just to make indexing easier?

They don't. Will lift this limitation.


>
>I see that the number of algorithms is also checked on extending.  Does
>it mean that a situation when not all PCR banks are extended at the same
>time is considered an invalid one?  That may be a problem at least for
>DRTM which may extend only one bank even if several are active.

Great catch, I missed this usecase. Will allow extension of subset
of banks.


>
>> + * @algorithms_count: number of algorithms
>> + * @has_register_index: whether @register_index is valid
>> + * @register_index: native register index
>> + * @readable: MR can be read
>> + * @extendable: MR can be extended
>
>At least with TPMs, whether a PCR can be extended depends on locality,
>so this isn't necessarily a static property.  Is this flag expected to
>always be accurate or it would be OK for a provider to declare an
>extendable MR but then deny doing it?

Okay to declare it and return some appropriate error, like -EPERM. Will
document it.


>
>> + */
>> +struct attestation_mr_props {
>> +	unsigned int id;
>> +	const char *name;
>> +	const enum hash_algo *algorithms;
>> +	size_t algorithms_count;
>> +	bool has_register_index;
>> +	unsigned int register_index;
>> +	bool readable;
>> +	bool extendable;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_supported_object - Evidence output description.
>> + * @format: evidence format name
>> + * @max_length: maximum output bytes
>> + * @binds_mrs: evidence validity depends on MR state
>> + */
>> +struct attestation_evidence_supported_object {
>> +	const char *format;
>> +	size_t max_length;
>> +	bool binds_mrs;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_caps - Immutable evidence capabilities.
>> + * @min_challenge_length: minimum challenge bytes
>> + * @max_challenge_length: maximum challenge bytes
>> + * @max_total_output_length: maximum bytes across all objects
>> + * @objects: supported evidence objects
>> + * @objects_count: number of objects
>> + */
>> +struct attestation_evidence_caps {
>> +	size_t min_challenge_length;
>> +	size_t max_challenge_length;
>> +	size_t max_total_output_length;
>> +	const struct attestation_evidence_supported_object *objects;
>> +	size_t objects_count;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_object_request - One resolved output object.
>> + * @supported_object: matching capability entry
>> + * @output: resolved output blob
>> + */
>> +struct attestation_evidence_object_request {
>> +	const struct attestation_evidence_supported_object *supported_object;
>> +	struct ctlv_blob *output;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_request - Validated evidence request.
>> + * @challenge: challenge bytes
>> + * @challenge_length: challenge length
>> + * @objects: requested output objects
>> + * @objects_count: number of objects
>> + */
>> +struct attestation_evidence_request {
>> +	const u8 *challenge;
>> +	size_t challenge_length;
>> +	const struct attestation_evidence_object_request *objects;
>> +	size_t objects_count;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_result - Provider evidence result.
>> + * @object_lengths: produced length for every requested object
>> + */
>> +struct attestation_evidence_result {
>> +	size_t *object_lengths;
>
>No number of objects?  That would make this structure more
>self-contained.  Copying `objects` from the request would allow passing
>it around to handle results, but there may not be too much value in
>doing it this way.

Not really needed. This struct is only related got evidence_get cb and
it is always used alongside with struct attestation_evidence_request
which has the count. It would be redundant to have it here too.


>
>> +};
>> +
>> +/**
>> + * struct attestation_provider - Immutable provider operations and properties.
>> + * @evidence_get: produce requested evidence
>> + * @mr_read: read one MR
>> + * @mr_extend: extend one MR
>> + * @evidence_caps: evidence capabilities, or NULL
>> + * @mrs: fixed MR properties
>> + * @mrs_count: number of fixed MRs
>> + */
>> +struct attestation_provider {
>> +	int (*evidence_get)(struct attestation *att,
>> +			    const struct attestation_evidence_request *request,
>> +			    struct attestation_evidence_result *result);
>> +	int (*mr_read)(struct attestation *att, unsigned int mr_id,
>> +		       struct attestation_digest_set *values);
>> +	int (*mr_extend)(struct attestation *att, unsigned int mr_id,
>> +			 const struct attestation_digest_set *values);
>> +	const struct attestation_evidence_caps *evidence_caps;
>> +	const struct attestation_mr_props *mrs;
>> +	size_t mrs_count;
>> +};
>> +
>> +#endif /* _LINUX_ATTESTATION_H */
>> -- 
>> 2.56.0
