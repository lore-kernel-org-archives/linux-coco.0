Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1B32E121;
	Mon, 21 Sep 2026 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981540; cv=none; b=XqpQoAmWnfTWDb/QgjBq6H9EEAqut3hmNK4WMkt4PGDntDYp72QgTgqBtlc3kKQul/tBbTtJHhXk94KvYaT1VKi8bRcZISahd6ucYZ8jqBox7zORGPKd3iqUw2nhVvndfOeFEPeS2iKF2qLqnnOL/yaMj3rBXarg8rPaGEYFUqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981540; c=relaxed/simple;
	bh=jJTGHX/hrYg5p30Fxlze4fHoDN8bn+7kwQhXJb+oHZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pmp2qNEhrPWy6M07qy9pHbUsm+WQfNrF4U0qb9b6l/G78UTTwvMzayOWtxneaNeAkuvGkacjUob+p5Ed/uSzvGmtXEnMsHVWoE+0vdYydoNUB6B3yWzl1TY2I8+0Rppqv6G57uPChLOqJ5zXzSGfdKXLjT08usf5osQ8oeepNWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbVyvJ+2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbVyvJ+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBDB1F000FF;
	Mon, 21 Sep 2026 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981539;
	bh=nwzMj+wKLAhRMi5iVspOLaW9J0cdkcPNjcJO5g6QxW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PbVyvJ+2T/4MbjOWH/nmfpWjfLrH55pL9UbQZ9Z+toGw4YMB8lO2bOzSjuXX7CPBC
	 tKzfg0xWuVloIVwLSs9SUTqflFjwTyLNWDhHn+uqOmcHYCeL8YIJ6CurK91G2HcCcc
	 jmI+N7yi7n1lDkBjIRCK29gg0g3BPobmesr3Z60en1UtGcag+iCqZp/53jN8d6Cadg
	 ZXSsAORtdWzdY2W/RUYZAsQaWT5d9ekdKEbN0MZfNaQIHnBN6K8uRiayMJnXOEp4il
	 9rfEJ38034j39y45DP0xi1/hozbfvU96XBjTEpHU8gHF3mYMytHsm1QRCUDN60MXMU
	 ld2dt73by/fHw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Suzuki K Poulose <suzuki.poulose@ram.com>
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
In-Reply-To: <arDwTjQiqF6VZOau@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-5-aneesh.kumar@kernel.org>
 <arDwTjQiqF6VZOau@arm.com>
Date: Mon, 21 Sep 2026 14:35:31 +0530
Message-ID: <yq5a5wzz3rfo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 21, 2026 at 11:08:04AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
>> registration with the RSI initialization code instead of pageattr.c, which
>> only needs to provide the low-level page-attribute transition helper.
>> 
>> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
>> the Realm-specific encrypt/decrypt callbacks and warning policy.
>> 
>> No functional changes in this patch.
>> 
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
>
> Nit: Suzuki's still at arm ;)
>


Will fix. I copied it from:

https://lore.kernel.org/all/bb59b1e0-2550-4a9d-8738-a54e5f106f45@arm.com

-aneesh
