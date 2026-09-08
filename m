Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9741339382
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889339; cv=pass; b=mFz+1qSMZdZkrbK2qfODRpLOMbcUN4vldhLWII/6XiAQW4Oor8VgTgDYP8RL+CMw6WLBd+7FjKId4ztkMheoxUMUfoLIahc8SjRidMZb59uce/2EVyPSJ5UQP25cR7fA1NtyATSiK9iiVeactJNs9osoYbdVXjMsf7mgra1hkRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889339; c=relaxed/simple;
	bh=ZU4SkGLCQl6PTS0EDxlLzNT+Jubeap1l3JebEpwsgdo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNcXnWl/6xLzj1xWXgNxDnXRZ/uWXJpWR3qGvlajtc2qfgI9Jn31bxuo5cKB7/+S9zqHopw8dMrKw2ZdfmJt4lyHbyrI7UopLwQfCbgOT4Ui7v5wZCFwovKGmqYOTZT5q8qen1Jb1D6AGWc6oRfglIImtzs40kymFloMG46SQSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qo+B7W5V; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qo+B7W5V"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9104956083aso37375686d6.1
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 10:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788889337; cv=none;
        d=google.com; s=arc-20260327;
        b=bSCh2osrSQ36Sgqm+5txBEqZm18jwXITKsNy3S+dmt7kbtYFuhZ/Bib54IQRPoLp4S
         ZIuZsNqggXS5sX2OVc4jbYb4F/ItxAZCrwJXH+qTP1f0O6Ao9fCwWItMQdc45znOb8yU
         cP0dIhRTqC13o97ptXz1mB1vOwgMhD8gvGP2PidO0Rq2j80sFMuu5UIXFTrt91CsucVZ
         ERR8wiKz8lbx1RgJClHqlGeCKbF8yA4PoDVwp/llg3Sj1Y7pTqiYtVBmvAnt1BqO+Zqb
         coNmhVXzQ/fg0J2tGnmp/WlzeYy8gKfCEX6O0iDBM+1DTV6Yyto9o4IaejI2SjCHSiiD
         GciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        fh=yq/Iqf5cPwpqQRVY3FR/BhlQeIjCAw6yc8A6Aq8ExGM=;
        b=TYthKDxpVX/j+9b4vOLvwsE2EHzeXe4zwnX8uTR6ibGNpG77a9lLPofGPhBT9sKzog
         unEJ8OmiYsBFkXrb0NmIhpdZCeafJnP08Db9ffbOYKgRBPhhXEbZdAz6s7OMqbG1ef6G
         kwPUPU3BiT8JHMH1C+WQLHEzeFpGMl6C1cG7+2IoGMQEkGuu3HnJ54L7IdP7iaCH0bG6
         Jk0iX72oaDvz29lC7RdZEwtIcHh3r0QXg6xeqjoEaBdXk2v51sst9PjM2cpgjm7FY6+z
         wbaPob2DmCG08Hzcin7RvG7EbYuz4NIv0fewtVlfvucGUP0rNdJt2vZNBIrdnwcjtVGk
         q7cA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788889337; x=1789494137; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        b=qo+B7W5VpOPM0Je3x1ShBcpyfL80e5yr5GHwMtqY8ncb9cK99pkv6DKNNWgkMOHmif
         euHN8usNL84tI+J3gaUH/74GIz9lzfhB3XcpuSF3T98vz/tyNcWpZ/W6CG9wRM+cmytU
         S6D8lu8xveSKNNkGiWtFiFAcxHB87OUcmjk4O46llGBwqASc6cjeMaWtyO9aBBXqIJl+
         INolPVWFtDmsRcOy1ND91AwZqhDMHvrkUbLqEatWpY9+J7wj3slbDStrDH/0aaT2jHoA
         zHDBXYp3bLFdgHBQw+vpkPeX6rHv6PY5iZ27D3oPbv49FMe2nSvF8JC03LqhdczkJ59z
         UNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889337; x=1789494137;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        b=O0nyF5Zd662OHg2a+54oKVaZeLR03/NbqLYcPKmKDMQbRKkYJ9WFCoDE4T3/kZckDh
         y/GYSRcxMYzQjtaNzZL5FezCF+9H8EAJ9XDsbO2xWoutDkY90biEGeSPZveCjciY9RY6
         BhzBeLXYnUtPzSzTwmu8RsCRgxIue6KshYn+bwVv7ERrrZOiYW/vDFXum8bFAo+NIawA
         l7HwMU3C7V20y+Ix7us3aqb0Zm40FcwdQbcdGpc3x5jyXtjMPpRVxItAu6unAv1F89Uw
         2wbMjmoP47JTaON77/iEbeqkq/3slJG7JnnzAHcDSVSAlwIsOD2aseNzOsou9bt4kAiw
         i5ow==
X-Forwarded-Encrypted: i=1; AKwUvBwtsLTRY9szw8bG3W4y2fPzw0OBeWleoNhkVxHhyb963uUEGwIuyMJUvIoMunTKjFLZNyRZ3kLeQnUP@lists.linux.dev
X-Gm-Message-State: AFuF++lIbLH5K/MEP+EVOPgIdZGB4utrCcMTUVZ+Iz8bLa/ewx92CtgK
	qwq9/47pWJLuljumZ+zZEVgNzHOIAohZqPk0mwdexqzHmT3LAIcoRE1HTK6w+msGgc8NG3Sj+0i
	97sj8XPJ5paKKWZoLYNZyF9bmRJZO/iQ3nJ9CZUpa
X-Gm-Gg: AYBFou0Ppu1T+yR/pkcFiOe8BWQMooG4pdX4I1bjI+hl07Iy9BV9ekLnozo4iURH78S
	jM32VhsJranqQH3gktXSy7gX2d7D9MD+5HYYvXhdSkYxV14FJO+yuRw7JPcHFGj9hXkUYpbX/yo
	VgUyrwCNHlnTOA3p5w8lXadjXgbg6h63/6ITrvuaaxXebDZdLz/EqPeDV/gmhuZ8m9J9CMv8P21
	heXyWdR/st6/gEm08854aHP3d/xyEa/prS7lDIkozPLtpmzZT9ymntRmSeDSLjVfaxZEYtr19AX
	erx3kbYj04QoFCWpasmSWc3lTSEl+z+g/Bc9B1UgGup6hQ4qyP6pq/EL16jBEr8bnjixQGvrTJn
	715KeMkIWSvgq7nTKeJrr6x4m2LWhLLaFavvV+Qh9/A==
X-Received: by 2002:a05:6214:5543:b0:90c:e762:1f86 with SMTP id
 6a1803df08f44-9103f0d3e3emr182149366d6.30.1788889335692; Tue, 08 Sep 2026
 10:42:15 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 10:42:14 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 10:42:14 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7327b274ef823e89cf664b33d94d9c2ba99c4ca5.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-2-15ad654a50db@google.com> <7327b274ef823e89cf664b33d94d9c2ba99c4ca5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 10:42:14 -0700
X-Gm-Features: AcwNN1WIzdwbZuZ6_C1HEL-Qh1G_nx7IFRuMDHksUPDPxufQ1MQ22MWJYpWBBLQ
Message-ID: <CAEvNRgG0v9DKgjwcswtprEwoRC0Y4w3VTYszDnJkbknWR3rvCg@mail.gmail.com>
Subject: Re: [PATCH v14 02/22] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "afranji@google.com" <afranji@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"wyihan@google.com" <wyihan@google.com>, "sagis@google.com" <sagis@google.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"Wang, Roger" <runanwang@google.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jmcrey@google.com" <jmcrey@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> From: Isaku Yamahata <isaku.yamahata@intel.com>
>>
>> Initialize the TDX S-bit and the GPA tag mask in
>> kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
>> is initialized for SEV VMs.
>>
>> The TDX S-bit is used to distinguish between shared and private guest
>> physical addresses. Its position is determined by the guest physical
>> address width, which is either 48 or 52 bits for current TDX
>> implementations.
>
> Since S-bit=1 means shared and C-bit=1 means private, we can't have a single
> bit. I'd justify why a second field is needed.

The s_bit field was introduced prior to this patch series, so I think
the patch introducing the s_bit field should have justified the addition
of this second field.

Did you mean that we should add something related to "Since S-bit=1
means shared and C-bit=1 means private, we can't have a single bit." in
the commit message to reiterate/as a refresher?

> For "untagging" GPAs we could
> have a single field, but there are other usages?
>

I think this part in __virt_pg_map() requires separate fields, are you
requesting to only retain one of the c_bit/s_bit vs gpa_tag_mask?

	if (vm_is_gpa_protected(vm, gpa))
		*pte |= PTE_C_BIT_MASK(mmu);
	else
		*pte |= PTE_S_BIT_MASK(mmu);

I think if there's any unification/simplification required among these
fields, perhaps that can be left to another series.

>>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>> Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> Co-developed-by: Sagi Shahar <sagis@google.com>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
> Nit: these are not ordered correctly. I think KVM prefers the order in:
> Documentation/process/maintainer-tip.rst
>
> But I think at least the RBs can be grouped together. Also... can't really point
> fingers here, but that is a fair amount of of patch history.

I was also involved in some earlier revision of this series, tracing
this history is not trivial...

For this series, given the long history and many handoffs, shall we help
Lisa out by explicitly requesting to be credited on specific patches?
Emailing either Lisa/Ackerley privately or on-list is fine :)
