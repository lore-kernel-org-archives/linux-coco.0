Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599929;
	b=umPym2iDd30XiESCU2crEYmiF1WIUjIGw0W9/I+TqYTGL+7/Ss02m+fHsCa2dFR4ECJM
	 Baq+PGK0cSdfwYCvua0vBpiYd7zLH9SkQgjle6OV0/aj+GTcsjrrrR6bP4o+WeV0JRlMi
	 Vz26v0Y7+4ZP3Ru/U5ft/CiiSX7+d3og8akKt2t1a4rh7SoQTVPRZ8h5HZ8A4l4PwfPUh
	 yT3zUfVSoEOHg22xq8YVsjSEJWu46NAiUZuKI/5Wy8NFCgVwQVtHBDHEWCP2yl1pZumWq
	 ZIUmKdV2z5ZSU3IRAOpWDV6ni4FZc6pmLNd4w6VAf/Pj+e7J7FBX36jlAhFw8+FVUWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
	b=SjgFoeMt2cLx6o7FOhIV1QqqxYJ46l0q6O3JmTfnv/KXKxc6G673doNBdDe4UxsDQvXH
	 W97MYULnDP9KxRKgDXHIf0OryG1n+F3TADEg0VO9b+3YqF8Fqwj6P/qkcqf1Apt9AOEUc
	 rRE2pI0HeCb13poi744wVl8Jm0Ux3yRorF0SjsSuIH9PN+a7W2s/J/20YCBO/Me+K2N22
	 pyVmovUx8YcItFk5513R7XasZNX+ni6FmXc8mHxtODWG2ba77ugLmLRGpe8MJmL/bMeNZ
	 aGjTnnwlipOrdHzLpF9TySSvy31JGZasMDaCW8ym36dEoz4UH1zNG3wqK9GDXN2+UvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="peKR/ng4";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A2A606A31A
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 16:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=peKR/ng4
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c445c95d553so121139966b.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792599927; x=1793204727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
        b=peKR/ng4Acyx1QS3YkfjkeZfj85ncYR8sNf11KoxaV1Kq5B4Tn5a6AnolXBKtsaCtq
         npU6XKCqr88HkwiNjssXSPpKyN366tA/fyS+fzP5TNw/tK9v/C2+9Mrpt8gT9pwY1oXO
         mknAgKjHr27zQFIKvJqcd9sF57Lons6qfznfJyiw2WX/lrlh0OtXwSo8fYBeTuuGJmNG
         NcEHyAO3HpYxLDPw0n+y6vzepEeu1AtATziTt4enTeZArk1KEDz8jaAXMPb6N4DJaqfa
         oZz0KUT9S+lTOtqDJKlryBy31ctS0mQWJJa1MBmHZYlbrmXL8sQy1BIMAaiP4tIUnmdj
         bCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599927; x=1793204727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
        b=YuSuc0BUN+hbVIRb/WohoJPUfePxOp8SyQWh2PjkKWkvDe+S0J6L7NGkQz0aRJfjE8
         8njzzxmcEf6SBQuO04yZmW2toKzmZZtBwOObbW/CCo/juMz6siZm6lzjG91CdsUjRoMG
         yTzRWlEk0fivyUFTYdF4/5AhMgz4OfDgMIufHiDoJE2lOcRLEvsTRP0ESjk16AQEuHOm
         mDLDO7LwU2DX0At6tuBkH1V+lW82Kqg0741k/YiopvacmKjzzS9PSJ9oD400RyWJJ+Sz
         P+mao+jTusjVeRL26AeI3nsaww9mXzipAs8EdERisXAv40DtKrlFxnJYTYdKYPwdBytq
         7Osg==
X-Gm-Message-State: AFq9FYLRE8dClteeLPqFKw0LJ8SdTkrn6savJwDr+YrxEdUWT14MudRm
	DbzDUz+I5RQYJbzSfq8ObQ8ld3H1IihfKQWNbvaNpVi9JNIhQWUtDFvEATrv7zF0YoE=
X-Gm-Gg: AYBFou2Pq6tqUvzU6RyfV73V4FL2Vcwqb+a+JdasLjbJVLFvNfmCRUoDpMzc7U7zkGS
	swmrafql5xTLfAycNGZIMZ2Oz1OsBf4kc/nNvmKTrxv0H1ASOBSHuw8Z2BuQNSQUiR5LUwYfz/j
	aMbt+3n/zPghY7/QSJ0EJjgYRm2kuvimK5hFjeqyD4YFRaEH7DQTmVFOr5sbRACF5hqR8tHMrH1
	difItM2uzKNY8H7C8AAD/D37Jx5CO94MC8oQdx4jQ8wtPFaGD9JOOEgwTvJoRreR8yZdUjMGn4x
	AIhYWaCneFEdJPkwv5HSkDIiJsmZ6ovwz+FTQbQlFO2NXpZw2nMFHUSTgddDeNX8yLerHDdTDNJ
	tThu51Ldis99s6W5lQZ7VIiSnwlHFsjBGT1zZNSyFfq3w0JTRj98NqoD4o9h0tRjAevU0ynDFjY
	9EIKlhq3rCOfQtZvF+DEPTavq5ebRRmmjKo1TLBGDPb0jyNa2u57HTKZ698JWJN3ZxpgYH6+jmN
	ZNhzIFZAJxyG1Xqhf/7FfB7wFHFe+KMW15e+qLcxHsFYuxVui9K4GZKn5UY08zeGsgr
X-Received: by 2002:a17:906:dc91:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c4679a40b62mr221295166b.48.1792599927374;
        Wed, 21 Oct 2026 09:25:27 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a6182e8sm17768966b.81.2026.10.21.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:25:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:25:23 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atjnZ9oVYZN1VnwG@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <20261021003056.354a40ad@jic23-hlaptop>
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
In-Reply-To: <20261021003056.354a40ad@jic23-hlaptop>

Wed, Oct 21, 2026 at 01:30:56AM +0200, jic23@kernel.org wrote:
>
>> diff --git a/Documentation/ctlv/abi/ctlv.yaml b/Documentation/ctlv/abi/ctlv.yaml
>> new file mode 100644
>> index 000000000000..fa11bce98f46
>> --- /dev/null
>> +++ b/Documentation/ctlv/abi/ctlv.yaml
>> @@ -0,0 +1,186 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Checked-in ABI snapshot of the ctlv family, written by
>> +# "make -C tools/ctlv abi-update".
>> +#
>> +# The checker compares this family's declarations and inherited stub fills
>> +# against this file. Updating it is how a UAPI change gets reviewed; an update
>
>Slightly confusing text: 'it' is unclear, checker or this file?

The file. Will reword.


>
>> +# that removes or renumbers anything, narrows a bound, or makes a placement
>> +# required is an ABI break, whatever this file says afterwards.
>
>
