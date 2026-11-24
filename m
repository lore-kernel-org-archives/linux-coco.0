Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522399;
	b=a+8vdY1DOtwiulBGOqKd8WR32LfDgZseTlYPnqWv/dfC5sr7z09jbbeCQtQMiN81YaA/
	 zSKbHA12zxMDs8QiEmQ2v0T4I9T16a9+vKKAr3ybH26B1fp3dUzBZ81XIi7ZuC5uJMZ6f
	 WloyY9o/1EPSdBfMs3vGGrf0TdOPAgHmLY2L3FaKuCenpYJWrtH9Mt4si1dqryQTr1ed5
	 ac7yBGBm/b/dp8cGZBofLjJkkB+YD9gXoMekYTtvN1yyMbcUnaxihqL2h/Q3OjuTqxw+r
	 Rcs/cAjK+IWg5TtJAB/xvXIwQdAY0jZlzOzTX2NrRxE/txMfEQgkBN0B02DIMM/gLeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
	b=a3KhYQ9gH/TXIUpFfGYZh+YaVCU3rnkEUdsSU5PRlO7caxGr71bTpVW4ZngYBZe0xG+b
	 UVrw6HU1UZb3Zz2q4/DuK5+dOID8vxcsriHEomBTuyuuVuQ09EOnvpUBFbxWkLHsyJXq4
	 C/UgGwALYhaL/Qc3rAYlKotuBAY/ciQWUSOEybUwUhKeBmKyBB7CXQhYXVQRwxZztLsb4
	 UsHTm5YDewQ2nfe1YFHqWkc3DYIcwWY/yKVAxm8jSxIo0bUTz8GnjqYsz/WtOK8GqPMtg
	 Q1APFYZ4oOA7ZY8ioSaXPrDWWBaSTEcHelTxzLfPAC0KJtw9lQsXa2Sfgllcf9EDEpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="dF/jHKc6";
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC954606A321
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 12:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC954606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=dF/jHKc6
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c126f80426so4404860e87.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 04:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795522396; x=1796127196; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
        b=dF/jHKc6/Mz1FDaPuWeqfsMessXlxmQyEh530Io8+piiHzAmNxMG9qpjt5BPm35Qyf
         vAS7moa8G7PgOe61xLHLFpYxDjel13LyNM4yKkjPXK8A9pqRHQA8SX2UZc8KunEa5hqf
         ziqylqAZgHUErEUqoPrUABcRNtcxYscXz1WkZJgXfZVRq5DRadhhl7/pCiNjsCH1vM9p
         caEABtEHFgZyeEcTTtyuzoOjRIJ/DPfjDl5t2EDb8r5ROxdX53AWCQD0GsdYREFq/Fo2
         LLDwN015MrSTfeHhHMBkGMdb8PMILe0k5zfWoY+cDvBKwPvUQ86El40rvEmF7UOhclCg
         Pb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522396; x=1796127196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
        b=jMyaNvqQLVgSf0u6vKX4VI3KK4HVK1kfeGjhvy0wMnpkgznPak89ixZ6N07Qq8HP0E
         V4B8ziu3kTjIHMlmWDJllOwg9DZwD9VDepscmLhpDPkdL/gvExs84rU35jpnEJf8oB6a
         px/nZDRUfxh2KVglorG5JMZVvoeYDZpJszMmBE3wN4OjDxNRyuMVLy+YYp8PlCPeNyQD
         auTDLT796t6oeDYz1YqyXGHhE3GGQQ+C1b9WxHnQUmN2hQW1v8/yxobQdlCkXQ1xHEV9
         dEykEikG88I/v5Er6swoOubR32HUA6HMfGclyWsteWbzPH9ct5lxY1lYpyRX9BVGtSrp
         SipA==
X-Forwarded-Encrypted: i=1; AL+hErFtNYa1jy0nrxOy4r99jTUGxGOKoZLk21ETjzEDTIoVx3B2HznyfLbUiXlKjHeuxy2xyolU6Rn/pKOS@lists.linux.dev
X-Gm-Message-State: APuU4Z/EBirYJAv57/LZ3HIf14VwoeyR4XcXkek41cdPVBx6Y+lTECuE
	2uFwYV9DkBs/ZsovcK485inE1a00tKTAUEEN8vU4g5AiESg4oxzZWRg0M8LbiIrM0mg=
X-Gm-Gg: AZFdTZevEdueEhtyg+qgLX2NXyB2j6euRVvybrchNZarvhIVSJk/+9M7vKgQfzwSgUZ
	uASmbG2Gea2S9LqD6xvO4t2DLYZvxRfPUcwjQb4h4uCFBfj8KRe/bE2tTKSJYJ+qLuwpf4raa9P
	q9JEgWHne+vJPdrPJr/mjutfrFzV8LFbBnvJHcFjgy3GVl+t3fVUdDt51nxcerKOHtRurlS6sPh
	TFhK52CyGl1Owi4uwNkgvoTG1pZRriChn5Yhhr6vvboaGERaTWOrIITJQ5QYEnZVPj34vQufnPz
	OK44k+LXqk+rYOrfWe2MINf1TYhP5jgdWd9KJwDQGHRwNmqVX8rnQ+KTuu9usu89q2sYMKPE+x9
	9DYwPto5v//psZQgX/AxxMC2wp3rPuafGnG3dBp7u2y0gamNyLg5UxsL082HIv17VARbSpak4e/
	vm5KnNOfCMdIMsm6/txGoUiGklYFDTvfjUae7EGkh4yLDuAwe9EGsGXbQbChX/Hb/BWfh1WSFaq
	EXh0I6EnQ0LTrRalpr9S4yTpY95lJyR2z1n0AirlhkQ2oxLWRDhJrK4en7FMroJZjtDXH8MyftQ
	gcSaib5jtvgVrAQSowypBmP/BNBvrNFJyYCpWA==
X-Received: by 2002:a05:6512:23a9:b0:5c1:6065:40d with SMTP id 2adb3069b0e04-5c1bc867b6dmr3406850e87.38.1795522395833;
        Tue, 24 Nov 2026 04:13:15 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01c018sm3681005e87.44.2026.11.24.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:13:15 -0800 (PST)
Date: Tue, 24 Nov 2026 13:13:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, zohar@linux.ibm.com, 
	aneesh.kumar@kernel.org, dave.jiang@intel.com, nik.borisov@suse.com, 
	sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <awV_P5443pO4yJa5@FV6GYCPJ69>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
 <20261123151128.GD179082@ziepe.ca>
 <awRYr7yB8IWj7S3G@kernel.org>
 <awRan8ZELzpTwduV@kernel.org>
 <20261123154042.GI179082@ziepe.ca>
 <awRe-A_KeE_kXyPq@kernel.org>
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
In-Reply-To: <awRe-A_KeE_kXyPq@kernel.org>

Mon, Nov 23, 2026 at 04:42:48PM +0100, jarkko@kernel.org wrote:
>On Mon, Nov 23, 2026 at 11:40:42AM -0400, Jason Gunthorpe wrote:
>> On Mon, Nov 23, 2026 at 05:24:15PM +0200, Jarkko Sakkinen wrote:
>> > > > > As per the function, perhaps tpm2_calc_event_log_size() should be
>> > > > > relocated to lib and have non-TPM name like firmware_event_log_size()
>> > > > > or something.
>> > > > 
>> > > > Probably under drivers/attestation since that is where all the TCG
>> > > > formatted logs should end up. It should be 'tcg_event_log_size()' or
>> > > > something. Maybe a tiny module for it like we would have done in lib/
>> > > 
>> > > +1 for the name, as it is obviously more accurate prefix.
>> > 
>> > Location, I don't know. I was thinking something like "lib/tcg.c" with
>> > routines that are plain calculations based on TCG/TPM data.
>> 
>> I think we should not have new users outside attestation subsystem,
>> but the legacy onces will still exist obviously..
>> 
>> IDK either, but this is my guess..
>
>No strong opinions on this; just unpurging my thoughts.

Okay, will put have this in a helper lib.


>
>> 
>> > And perhaps for tpm_buf (both stack/heap allocatable), if Trenchboot
>> > ever moves forward.
>> 
>> DRTM users will route through attestation subsystem to do their
>> extends so the tpm_buf user would be the TPM driver inside
>> attestation. We definitely need this for ROT agility.
>> 
>> We should be able to build the attestation TPM driver without any
>> trenchboot stuff to motivate it.
>
>OK, this was my guess but did not know it by fact.
>
>> 
>> Jason
>
>
>Br, Jarkko
