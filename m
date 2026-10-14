Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734EE1DDC38
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959532; cv=none; b=H3FYFYrJ/EeQA7iRDlnMq2jSYCUcDDaL8IVh7APDKGOqREc6MjYveY6uU9Q/55qt12yxPZZ0vSaIyFGKe4FhFY6bo5UhrCjtGc09/YRsqUCuX13uJkCjNbGLw3CdAyGTYge4nwFnZjFtXjgCgkFVl0ornXXRS6OVMJ9LwOdzQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959532; c=relaxed/simple;
	bh=oQ3FpNfn9xeObVL8FMjjs394GlbWXXbUtCNpJzPWfeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pF4oMab3y9nTTNqLGE1doP8LedXExi1m4Zr7SdfJCFIcvZohV4QtnjfYESnnphJ23L8JyyE7K+RPngxBH2eUnVAGljO2mrYugaPrRAmZW/pxDaFF7cqr2tGs3mPzycvWrlYGhHSCTKM8uu+qdUhoBNuooD6VLso2ROZd4XsQAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZTBbd3E6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZTBbd3E6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso47968575e9.0
        for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791959529; x=1792564329; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1SKNAlUg9TrD1fwVGl6kQ8Emen5GvKQjxZqh6aLHjF8=;
        b=ZTBbd3E6LUkSOBVzsCi+JeOd/1eHlewndPIOc0/RWAY085fFFp5JmhjK5Vn9Lp4gVM
         nfHMuDeZJZHVJx9GpWJTmOVAeYPY2RQmGP9sfP2DTNBNJJUH5XCgMT3HsIEwKxfh9azV
         N2Xllgsq2upj9FWHddkBtR9gMih+aQ1VxzdhBNPPhzMUH6Ul06VykOoc6Z7V+GLOc/zJ
         WIE5eD9nwdT/baT4DDGdosKIsYmpvR0qMUM5VVFDagD9Zi+/pirvIAbSZAQwRel8Y3Tx
         PqkGk/fVI+TbAJXDzUvLwyzDrq9eh6HkChhWpjl/c76XKUKrl8tcWSpJYmRXu2NqZyiw
         PetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959529; x=1792564329;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1SKNAlUg9TrD1fwVGl6kQ8Emen5GvKQjxZqh6aLHjF8=;
        b=QwJ5IlEpYA24E3wmuhfek4SHNP/yPMVA9ZkuCWF90XOhH+ltNBo5brThGlYmNBdBC8
         qILdFCcCHV2mddzz/ZzdEzw3r70EOIe92UQL1t0Cs8TTrmxxg08PRmU/b5ufEZM8jF27
         t1vuFFthGnO6BrpNCp8L3/8SENKEH5cKbzJmeatUaUApoh9jbkFzXA3kNpYrJM6gIs5b
         XsVCVtbtjlWBEGjCttBVu51OYR4gdMah8cU+CR0q1x8pQ4gbsmPqd0uphHrCyZdLIVGz
         58PeB0L9/FLfqh4qc+Wa1YC6Mar2tFCMrCC5WPCOrTq8Pdkkp1UgYWnR4iHbwtDodujl
         GstA==
X-Forwarded-Encrypted: i=1; AKwUvBzThg2X+3D0wQML5oCOM1RiZ5t3VF0aiGgGTq/ytzeyJCGHxoJXzADVHau7e0L5+fT38P2pwT0KKbeW@lists.linux.dev
X-Gm-Message-State: AFq9FYIm1hyvpRBMoNQOqvZIQJ5PdJ6XVxYA0BpwckI3Y69999DuXJFy
	iHPqmYI1yMOSp7U0o8IU7u23uG2s7RHbtPU7zeTAlMnFqF9sNNwlzf2VXinUtvj0VwM=
X-Gm-Gg: AYBFou0JFbWbe3XtKeB3APCE4qOZGSleB4SeXn0/p4OLQQs5ma6j706mIpNQ3p3N0i1
	uX5A2+P2lf16NArNOVMi+Sx41dvWLBW+xZ0xaZ5zVZPO+qZnOOe6tyD/6lRUINXtJlE80dlVEbS
	DgE0J9VXraT8QuiidTyiDc9ONnXAb+1VF9ep0Cg+3aQdCaLSfrDeexJ/95OtPszO93iw2AMy1QG
	iWYXeYD+u5th/0VTOYLLu+wc9SlHbFzzAUA1Uwn4lx+RcH8sx2rf6oN1D/ANKgucDPhMjpJWHUW
	IA9LdrLdcuMMzE3aJ/haLlpTE4UrfVxozTI932zxOF5c/m1zCy2az3VHcvrm7AMCgWsKWErOmpT
	5bUF+qBR14mZBmv8gGU20pkXMpceB1vm5mkxvD0Beok8ACkavxoZq0IHht64rAHsyXVtfU4Qg3Y
	6cXTPJjDx3l63bT3XO9LNVYs9JZc9i727i/IM7N2dPwemN1jSbT9BtuHQGYTgiFN5X+k8HoKNZo
	xGZRAz1ELn/DRuYVhLbovY=
X-Received: by 2002:a05:600c:58d3:b0:4a1:9388:7f40 with SMTP id 5b1f17b1804b1-4a193888295mr178393265e9.4.1791959528597;
        Tue, 13 Oct 2026 23:32:08 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7773d02sm4224045f8f.13.2026.10.13.23.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:32:07 -0700 (PDT)
Message-ID: <2b73666e-d923-4042-b719-b9bdeca783c8@suse.com>
Date: Wed, 14 Oct 2026 09:32:06 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
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
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <00a4b474-eb13-4caa-90c6-b9cabb1ec621@suse.com>
 <IA3PR11MB9136F32FBA9D830C48EBA968929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <IA3PR11MB9136F32FBA9D830C48EBA968929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14.10.26 г. 6:06 ч., Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: Nikolay Borisov <nik.borisov@suse.com>
>> Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
>> operations
>>
>>
>>
>> On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
>>> Introduce support for binding and unbinding the Trust Device Interface
>>> (TDI) using the TDCM_OP_BIND and TDCM_OP_UNBIND commands.
>>>
>>> Executing TDCM_OP_BIND transitions the TDI state to a locked state
>>> (TDI_STATE_CONFIG_LOCKED). Add a sanity check following the bind operation
>>> to verify this state transition succeeded before finalizing device locking.
>>>
>>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>
>> <snip>
>>
>>>    	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec),
>> GFP_KERNEL);
>>> @@ -174,6 +233,19 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev
>> *tsm_dev, struct pci_dev *
>>>    	if (!tdx_is_dev_teeio_support(tdevsec))
>>>    		return ERR_PTR(-EOPNOTSUPP);
>>>
>>> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) =
>> tdx_tdi_bind_dev(tdevsec);
>>> +	if (IS_ERR(tdevsec_bind))
>>> +		return ERR_CAST(tdevsec_bind);
>>> +
>>> +	ret = tdx_tdi_read_state(tdevsec, &state);
>>> +	if (ret)
>>> +		return ERR_PTR(ret);
>>> +
>>> +	if (state != TDI_STATE_CONFIG_LOCKED)
>>> +		return ERR_PTR(-EIO);
>>
>> While this does seem correct, it's not really following the spec or I'm being too
>> rigid, namely:
>>
>> Since TDI can change the state any time, TD can't fully rely on the Known RUN
>> state in any scenario. However, TD can rely on the Known
>> RUN state after TDG.TDI.START as a confirmation of the Interface Start.
> 
> About TDI changing state any time, do you mean host changes TDI state,
> e.g., through TDH.TDI.STOP? Or you mean TDI device goes into TDISP error state
> due to hw error? Can't they happen even after TDG.TDI.START?

I've taken this verbatim from the latest TDX connect spec, I'd assume 
what it refers to is the TDI/device getting into error state because the 
DSM deemed so because of whatever reason. I believe there is an inherent 
TOCTOU race here, because you can at best get a momentary snapshot of 
the state but the DSM, which is inherently an independent entry could 
for whatever reason decide to enter in error state (highly unlikely, but 
still possible!)

> 
>>
>> But here we still haven't done a START, just a BIND, no ?
> 
> Yes
> 

<snip>

> 
> I understand this as a best-effort sanity check, not a guarantee that
> the interface will remain in this state.
> 
> For example, suppose the host creates the TDI but incorrectly reports
> BIND complete without completing TDH.TDI.BIND. In the module
> implementation I’m looking at, TDG.TDI.RD(INTERFACE_STATE) returns the
> stored TDISP state without requiring the internal TDI state to be BOUND.
> A successful read could therefore return CONFIG_UNLOCKED.
> 
> At this point we have bound the interface but have not started it, so
> CONFIG_LOCKED is the state we expect. Checking it catches that
> inconsistency; checking only the TDCALL return code would not. This is
> still a snapshot, not proof against a subsequent state change.

Makes sense, IIUC it states the same thing I stated above i.e a 
snapshot, so perhaps this check could be carved in a different patch 
with the changelog containing this reasoning?

> 
> BRs,
> Zhenzhong
> 

