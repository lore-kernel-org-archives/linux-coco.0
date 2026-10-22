Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657388;
	b=P3dXZkZsjfaZI949/5OntnBQUSgEiQMldokbF0jF3vVIOTWT+k0I4MomJkwu1bAop8q2
	 g+D8I6Vo1C7Ra0Wkl+7TVkSMGgmVq/E0VzU2oGXeLRRDe3HLx1VosqFBXwF4mv12mft7C
	 TMSenOnmyMS1vZjRoW2YdYRxDXfyKBpGk499k6lRDLBJQwER1TkO8ifYOWPQgZyRoFEKG
	 zaxh2SU/jpQvbd2auxaqYqvNWUXxfCGCHMFe7pSq4G0p0TO4ENJ7iQo8Ayi2yOOffSrV6
	 +6xR0Dm2U0a/NfnBH4mTuPpg0092/WN1gxNSftDkNBW1FN69zQOckpgcVjxmbBOFqmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jBzwZmEglaCeHy9uWRO0K+mSZ4Ex83WBJUpJNZMKjxY=;
	b=V3AB53yZ6h4Y1HMEpxFSRgCVGtXsVu4qOeFdreZdAVmSqR73NSb253gXoE8MxvGc2pE0
	 DHmddqOlsExHmKA2GI3ZjRsasEgIlbxRiaHhqcEveV/zRSZXQajQ7kFvY0lACi3X90KdN
	 Ki0knh/akOUfSrYZRZXgfouC4wd7WM7ALnVkejln9k7E/1ltxL4Tm2ecwy/q00xtowF9Y
	 jcw1ZK1Pj70ij4k4ty8lNePdawq9LiZtN34a3Kmy17OyiD1a/E30UkmjZ7SMbcEA00Ufl
	 FepNge+1NsV1x6Rj/EgJyUUPbjSCQfGOYQ7hxjictFkm/KLOHZ9rXLuKZ7heJ9uiA+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=DvfymGCH;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D560A380D
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 08:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792D560A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=DvfymGCH
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so1258540f8f.3
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792657385; x=1793262185; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBzwZmEglaCeHy9uWRO0K+mSZ4Ex83WBJUpJNZMKjxY=;
        b=DvfymGCHYU3TdOSvpHI6/tdFsHkpn2GZUyOV0ZTdDJypLgS6EYNLwsDiiJ5YvViocL
         7EGD7JEF0ccXy6el9ScXdfK6CNr1MFltDujP1nvxNScIBvQvma/Wbm5zAD9TYecJmDYW
         Iwpe3JKvyC6mz0sXxHLMDkoPOmatt2QH/+cHkJJCvymYs1mij4mojLem7RQfVktzmMXC
         gATpOOUbYxc8D9LbX8JsA9uJjMma61rqHjcuJxPBcrD9rjXb7dWNwzmguUuXqNJIVLWK
         okz4vk/+mBt/MPgDnVr/Gw14HlRDxMs/WRJwLkk46dRl61+MS+nmORMQHBpcDWjxk1wn
         Yu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657385; x=1793262185;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBzwZmEglaCeHy9uWRO0K+mSZ4Ex83WBJUpJNZMKjxY=;
        b=oqIJXu4bTz3ZB8n8wBh92f2J5tKk5w6wdLWI0kLbzPYPw/VsfgRkt54UxI/RsvIukl
         ixcRec2hH5t5ADjMTGsiojiZm79FWCGLzCJDPBXItJY0asOyD704qnzZpCVdAanqQlsj
         nFSLmup240ASeIWieb6L/Tpu6bzJZNhjsT7Zcwi424x/Y5cFnvatwRyAVMz2sGg31InV
         FdBIgeiWDvBtXv1it0mQ2yQPhw2GdebDaHNQ4LjBCMT1n9CcwnHckafB2LKb3rYfvkz6
         miAJg0qCslqn3H8CHu7goN0JQX7VpoOg3HrwgMj9Jg9g+bPiwoGoywoo0+e9u62RNxq1
         UhBA==
X-Gm-Message-State: AFq9FYK44SeY8f+KqzZAEVBUw5qBVwoFeoDRkHGu+Sk7oYffb6/mKCx5
	sixIyHvi8cayEMUhFPo0W+GZ9x+67MiqBnl1i/m22merioHjCF6Wyow9ySu9xK8MJwI=
X-Gm-Gg: AYBFou2TmVEIk6VJJRWzCpHbhYESvmVhux1jEWSEYOV9ugf9YQrV+p36RdB3ua3KpbU
	mhjLLsuY27kdVMRZ2dAVGu5Ju1sihtNvFmzlAH00qRPpPhFuhDdEJRxNQ7vdu2bwDX9K3EnHNKZ
	+mJ4BawtLI4yEs1N/X7MXJwpOQyXBr/JtKE3aP0XsNOlszfX+EDs5fMvqOKOcrtaw1CYpoCiE9e
	ScjrUqrUbojkcol4lFVrGx0BVVe4V2/txPcI2eMw8ZVS18BNbMA5nLIzCL+CxYgQDdxyLszNoY7
	8v4+tRqg4PIaT+J1tnBY+hL0YNJO8oTpoLAaplYZlkd0YM2uWHSqULIg36WuMSh80707Ziw759c
	2WG0DdkcIVgas2M34EIOZe1E1pHUESykOiMS9Nnk4EFAAGJZaaLpzVdWZY1O0huO34SzE8GmaeF
	hFh1FXxE8YptwneoFibsXturpiKcYyPBkWjFwFVn6iQ8Anp7RkR2JJRVA9tpN0aK6GUC+Vn52TP
	FtV34451P+CabafQVb5IoWfdonYbInqPArvmFzCpMXCdvkvGiujR4h5oTAmWJnLUtePFLY0ab1F
	EkAYXI4Jlg==
X-Received: by 2002:a05:6000:490f:b0:48e:23e1:35ec with SMTP id ffacd0b85a97d-48e264db0b6mr9339116f8f.47.1792657384555;
        Thu, 22 Oct 2026 01:23:04 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1casm8493784f8f.7.2026.10.22.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:23:02 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:22:55 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 13/20] Documentation: ctlv: Describe how to write a
 family
Message-ID: <atnGniIHxIV-vzVC@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-14-jiri@resnulli.us>
 <179245258505.58760.3972297562218204862.b4-review@b4>
 <atjEgLYpgbZNzfkZ@FV6GYCPJ69>
 <20261021144951.GR3008132@nvidia.com>
 <atjiW8bnqDZ8zb5t@FV6GYCPJ69>
 <20261021164857.GT3008132@nvidia.com>
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
In-Reply-To: <20261021164857.GT3008132@nvidia.com>

Wed, Oct 21, 2026 at 06:48:57PM +0200, jgg@nvidia.com wrote:
>On Wed, Oct 21, 2026 at 06:24:12PM +0200, Jiri Pirko wrote:
>> >I haven't got that far in the patches, but I think it would be good to
>> >spend more time here explaining the fundamentals of how the extension
>> >mechanism is expected to be used..
>> >
>> >It looks like RDMA to me where you have some 'common' and some
>> >'driver' parts but at this point in the docs it isn't clear how that
>> >is reached. Like does each driver gets its own family? What is a
>> 
>> Depends on the consumer/subsystem. But esentially yes. That is what I'm
>> doing for "attestation". This patchset introduces ctlv-attestation-tdx.
>> Next we will have ctlv-attestation-tpm, ctlv-attestation-firme,
>> ctlv-attestation-armcca ctlv-attestation-spdm and others.
>
>Hmm one of the things iommufd does is to have several different
>drivers active at once within the same FD. There is only one char dev
>for the whole system and the VMM would operate all the hardware
>through it.
>
>So in that model individual calls are marked with the driver's
>identity when any driver specific data is passed.
>
>I guess that doesn't quite work in this model with multiple-families?

Nope.

>
>But it does work well here, and matches what rdma and fwctl did as
>well. So maybe iommufd is weird.

Well, one CTLV chardev is always backed by one device. I think this 1:1
mapping is clear in the device model. Iommufd indeed looks weird in this
matter.


>
>> >> >What about userspace, it "knows" somehow what to do?
>> >> 
>> >> Userspace sees the family chain. It also has ability to do introspection
>> >> seeing right away which op supports with attrs in which nests.
>> >
>> >I was hoping the introspection would not be essential to use the
>> >interface..
>> 
>> Depends on the user/subsystem. Either families_dump op could be used of
>> udev uvevents that also carry family inheritance chain:
>>     CTLV_FAMILY=ctlv-attestation-tdx
>>     CTLV_COMPATIBLE_0=ctlv
>>     CTLV_COMPATIBLE_1=ctlv-attestation
>>     CTLV_COMPATIBLE_2=ctlv-attestation-tdx
>>     CTLV_COMPATIBLE_N=3
>
>I wouldn't try to link it to udev either, by the time some userspace
>uses the cdev the udev information is gone, and may be unreachable
>from inside a container or similar..

This just gives possibility for udev to work properly. Depends on
the user/usecase if it's going to be used or not. Not sure what you mean
by "udev information is gone". Udev might use these uevent info to do
aliases, similar to dev/disk/by-*


>
>So there should probably be documentation in the subsystem how
>userspace should learn the driver family via introspection.

Okay.

>
>Jason
