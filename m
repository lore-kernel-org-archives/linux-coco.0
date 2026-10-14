Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D74414438
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 06:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959252; cv=none; b=EJE9+GyEIYgxLqO0V1JNt/gZ/Xlak5SgEKSfK95UkN8izEm8N0HZn5sBY1MEBF6XAiiyjs+uy+ZoqfbtR87S+C8+krPPomnBgP7XQHAad2GK/mA8Toai5J72Ry4qrxTFXO27zDUs+SOhu6ivuwfZ1sYlW4iIIvJ8/1acSAT7z40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959252; c=relaxed/simple;
	bh=ymRKRwWEolm17glJS8skH7f5fDFclMzxXYAshHo32BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seneHhg+Qfl1ifwE77uQ6FhrTRSOKCzqOrM6g1KtYXn5PN1KEYdSdSw1yN7Xg5Bey0pxjwyAD5Ebzi1Q270BXFdCxfVI++kNWCxTllzGkq7KP7pBqGV7axui3CjzY8BPGNTImbNOJGBDpYo17xdRn06VAO7lH27i4w4+TVBopPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YPGq6ENc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YPGq6ENc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so10595555e9.0
        for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791959247; x=1792564047; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p/b7jAuRdElkm76Qs8iHwa7PyYm8EqE5Ut+YVV4k7T8=;
        b=YPGq6ENcHmd5akwBrhb4NUwJMHq+Yj+J4eIune+cmDRiH4s9YbNzBG8lAIo1urRPwZ
         9zzqnjQ7Pin7i0bbPVcuhOChx8lXAI7T4cq/+1V2hw4hdc3AE+otfD9V2NiMweB0Adf+
         ZntaCEOnTCr6uDfxWapm3kKWWrcn7DGOG8UKyZa7pwgkgDPis2PoZ3j2v6QFV8p2sbL6
         9CwRg7Fr52zPUa9OSasNaVmoyQ8X+OcD+2CjM+9iWXNrkbURtoyb3uFri0ABxK1vB92v
         KRJEBleXzZiVsRs24bWec6lGVZdX7LW2Cc+qlyeO5avi+OCU3BEpM+q3HrkbBftnXr7G
         W4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959247; x=1792564047;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p/b7jAuRdElkm76Qs8iHwa7PyYm8EqE5Ut+YVV4k7T8=;
        b=VIl2uze1mhJMygjTmIRAg8hgwEaoSzSJyty9yfqyi8ME8rmwWy0Jqy7k/+yryuTTF9
         VR+S4gRsmp7fyfSskkh0iaWvdNDK+Z7se3HtPzBRdBIsSwKmkW0W99k+XUD7FL66rfD2
         lmJKdpMjlKZFMWk3gjbXuoZn6gAvzkA7pHv90Ln+v6O0QiVqoQsPMcm0W3mVvHb3Sccp
         q5OEsnPaYa7tWWICTNWHurthE08yJ15NVaMqjcoZ9eR2FBizU1yTI0CiC2mXE+fjw8c3
         4Hei1DVkn7+uWC+qxqKoARKz6TZ/9NZUj75b3/qMb5xte1Ru9uB5h+MCS0w64Xe6Zm2e
         C3Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzy1TPWPz8J3ZtaEW7B1T60Fxm90EcIBZTKTJbjN8ZNUXAF26WHNMxm7y8JUp9+0i804xAb8wHJtrtO@lists.linux.dev
X-Gm-Message-State: AFq9FYL6brug6cBlp4PjRtB7HGDhJ2kAngfSHPWDuDRHDgr/dhmc7ik8
	mfpKGDai4GUQSft+SXyA1Dy8vEAUYIcPLaIzzcyRLjeLMFz8wntdnqaCYX3Paf0uf1E=
X-Gm-Gg: AYBFou1pvqD9piCsXENeCSvLuUSmK4bwbFVvVNk8/mrwNtzgD0DehxctER4DyXv/TOr
	8nHWxSHlWCXunURAQxA8gsqIIucEuowBO5tgWFvo0O8y4bttR87Empl2OjHDShPx4r+DDD5jIWW
	6VWrEIwc5umjTQxpn47wAzZpVDBaAtYZ1zzj6FW1Szs8Qe/2upb5CA4Qy2ETYWvHNr9R8Bb2diM
	iFMWZR2mObgH7xM8B0s56nJflyYMEtqTo7QcaZ86IgV5dDaE7KzxQVvBXHIMLkuq8om9MZa1Kv9
	miWDqdcvbmhOpYrzMAcSLIKVCOs/LJFaO2jLw6NgRhxwV81LVe7+XE7QPObHBxnsB/NerT+RxOE
	KJVJvNxK3Y9vcdPLeYg3Q3v+wXUCCWWywkjEGIX7VBoYN9VxSJ2bot1vk7eAQj/eI+NXF+mKAKv
	bKpApmMR6tTKb0cAfnJrcH48kZfj0wmKD5+4/NMjtKG+kd/69ewY7lYepV2eobYkAiht0x3HEKt
	bRocM3yDj65zc0fhlSoQW8=
X-Received: by 2002:a05:600c:c16f:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-4a18e4ca869mr265070395e9.19.1791959247476;
        Tue, 13 Oct 2026 23:27:27 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm12518966f8f.0.2026.10.13.23.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:27:26 -0700 (PDT)
Message-ID: <c5105600-e7e6-4727-8a25-141955bc433c@suse.com>
Date: Wed, 14 Oct 2026 09:27:24 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "Gao, Chao" <chao.gao@intel.com>, "Verma, Vishal L"
 <vishal.l.verma@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
 <54846068-d545-4591-b850-2980ce57f40e@suse.com>
 <IA3PR11MB91362D1D89BF53AE630A9567929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <IA3PR11MB91362D1D89BF53AE630A9567929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14.10.26 г. 9:19 ч., Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: Nikolay Borisov <nik.borisov@suse.com>
>> Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
>> Connect
>>
>>
>>
>> On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
>>> TDX Connect is a TDX feature that enables secure device assignment,
>>> allowing a TDX guest to directly interact with TEE-IO capable devices.
>>>
>>> The TEE-IO Device Control and Management (TDCM) hypercall
>>> (TDG.VP.VMCALL<TDCM>, defined in TDX GHCI v2.0 specification) is the
>>> primary interface through which a TDX guest issues device management
>>> commands to the host. The host processes these commands and returns
>>> responses via a shared memory buffer.
>>
>> This patch contradicts what's going in patch 5. Because you make it
>> sound as if TDCM is yet another leaf of VP.VMCALL, but then in patch 5
>> you introduce the polling code to read the result. And there is not
>> enough information in the changelogs to understand why this added
>> complexity is needed. Isn't TDCM handled synchronously by the VMM as the
>> rest of the tdcalls, is it perhaps handled by TDX NRX module?
> 
> TDG.VP.VMCALL<TDCM> is the leaf used to submit a TDCM request. The VMM’s
> return from that VMCALL acknowledges the request; it does not
> necessarily mean the device-management operation has completed. GHCI
> defines asynchronous completion for potentially long-running operations.

But this is essentially an implementation detail, and currently we don't 
have the host implementation. In that case this choice must be spelled out.

> 
> GHCI describes polling the shared status and event notification as
> completion mechanisms. This series uses polling with a timeout; it does
> not use event notification. TDCM is not implemented by the NRX module,
> although some host-side operations initiated by TDCM may use NRX
> internally.

Right, those operation falls within the TDX connect spec. And TDCM is 
just a subset of the VP.VMCALL interface used for tdx connect 
management, in that sense it's not a "separate entity" i.e a discrete 
module but just a collection of functionality, implemented in the VMM?

> 
> I’ll clarify the submission-versus-completion distinction in this
> patch’s changelog and explain the polling choice in patch 5.
> 
> Thanks
> Zhenzhong
> 

