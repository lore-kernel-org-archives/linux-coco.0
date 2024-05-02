Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A9D26A
	for <linux-coco@lists.linux.dev>; Thu,  2 May 2024 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714652297; cv=none; b=nXyGaVE+3HO0e24hRGa/Ocka3dtCsRYA+D/wST71mZpJLaEcyH8+vQPYpOczy3YLK3xpCALjizayBCciCSTKI86sXXz2M+A9uWZoefC7t5aIR8CHFOs2PbmlfXDhPlf+03lrDI7CvUcOZ91Y/3PSCYgVBi52yPKLsk9Q5lnAtDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714652297; c=relaxed/simple;
	bh=oHlWu0KoAb9qV0ZB7YAfCQg7BPYUCGVVgAfx1MhkU4o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ghtPm9CF0arf6/ZkdUprmveFKRlUencam12kcXm8HZqtw99IRTu8ifWBvX1evbT321ClATXoXnu6f1XJSScoDfnb/42QvNT2GhLnStlr869/hYYv3YNcmrZjuOb7H99Irp/6gGTaXzdxQOMyumrOcuQ47KrCarEtxZ+roCMIL94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8Tg0snC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8Tg0snC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714652294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j0ouXWVXMSsia+jkf8WQfP89YFxtqAKEOm2AuOhT3gc=;
	b=E8Tg0snCqGSy6750rrW8ygczQ4i+Abs4w2E/J2rssdFABDym95YtJBfgVKf85q0V341y1W
	4HJRsPD/gzT1UFvUiSZQ+r/PjYGvVou52f36KjUbmolyYEdy4kPqYmB+88GCzOaqoHojsa
	EROzRbyKD3RD/CsnA+GlwZo/dEi7mD8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-0nE2O5F0OqentcxamLuXkQ-1; Thu, 02 May 2024 08:18:13 -0400
X-MC-Unique: 0nE2O5F0OqentcxamLuXkQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2decc7026a9so72121111fa.3
        for <linux-coco@lists.linux.dev>; Thu, 02 May 2024 05:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714652292; x=1715257092;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0ouXWVXMSsia+jkf8WQfP89YFxtqAKEOm2AuOhT3gc=;
        b=NpRolScRd/swqVXnYqR/r67RfcB8GEevi11gkfMa5tCOCGdc52hdA889EqZhjZ8vHx
         v7rRFmXWKYfMHRsUXtoRWyn/r+bGvKhRLlNQZuERFXB6+9LmcoZBJAmNRFe1kh4930ZH
         cwBKkH3441p/csZrO/mQMRVwDOObZ18RAeWOy+1MdP6PvIcxmQCJfkNF5CVNMaevc8kE
         JJipBJBDslApzCJGTvseZvaNXiVmz8S4tc3/ed77gsfmNX/3moywu5TgwwVby+b0sJe8
         EDWMNwT5qo8/6YMwZ6qd9YNiwkZ19x8FhUw3hxJ+karejZjx39yrflmMquwAKnF73U31
         r3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXBMeJ8DFjmJXtfvD9+CPT3wUBz95pbZJtRji6xbM6VLBnclMuRBY4pOq7zcJB9ZQFD9lPVcW+NIltuUTWfk6ACeoD+SvxTC4QKQ==
X-Gm-Message-State: AOJu0YyQTos6o1QkBfybK8VfLQqanp0+UZ+fWGhFUNj9dE3ojsMiLFF9
	Fag6XDwOlLoTl4hMSGmsBfzmWvNfteu4BPAzicngDisVPKmJsMUDajoo7W9iQHoFf8UFc3EnKUo
	QpN5ygaS9lqYnOaATNw3lCySxM2/10iJaeQH7NlStuVtEfRMPUghSdUzGt5Y=
X-Received: by 2002:a05:651c:54b:b0:2df:8ce6:96ae with SMTP id q11-20020a05651c054b00b002df8ce696aemr1459342ljp.7.1714652291912;
        Thu, 02 May 2024 05:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHLEzhel3J+Iky5AXISUEMehzZpROpO7wE4GfujUAp2fZWvLcpFCcbsttf2lwNUdXPb4hkug==
X-Received: by 2002:a05:651c:54b:b0:2df:8ce6:96ae with SMTP id q11-20020a05651c054b00b002df8ce696aemr1459319ljp.7.1714652291458;
        Thu, 02 May 2024 05:18:11 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id s20-20020a05600c45d400b0041bde8ddce9sm5535635wmo.36.2024.05.02.05.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 05:18:10 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Alexander Graf <graf@amazon.com>, Ashish Kalra <Ashish.Kalra@amd.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org
Cc: rafael@kernel.org, peterz@infradead.org, adrian.hunter@intel.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, jun.nakajima@intel.com,
 rick.p.edgecombe@intel.com, thomas.lendacky@amd.com, michael.roth@amd.com,
 seanjc@google.com, kai.huang@intel.com, bhe@redhat.com,
 kirill.shutemov@linux.intel.com, bdas@redhat.com, dionnaglaze@google.com,
 anisinha@redhat.com, jroedel@suse.de, ardb@kernel.org,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] x86/snp: Add kexec support
In-Reply-To: <26b3b3b5-548d-4ebd-9d21-19580a41e799@amazon.com>
References: <20240409113010.465412-1-kirill.shutemov@linux.intel.com>
 <cover.1712694667.git.ashish.kalra@amd.com>
 <26b3b3b5-548d-4ebd-9d21-19580a41e799@amazon.com>
Date: Thu, 02 May 2024 14:18:09 +0200
Message-ID: <87msp8mmpq.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Alexander Graf <graf@amazon.com> writes:

> Hey Ashish,
>
> On 09.04.24 22:42, Ashish Kalra wrote:
>> From: Ashish Kalra <ashish.kalra@amd.com>
>>
>> The patchset adds bits and pieces to get kexec (and crashkernel) work on
>> SNP guest.
>
>
> With this patch set (and similar for the TDX one), you enable the 
> typical kdump case, which is great!
>
> However, if a user is running with direct kernel boot - which is very 
> typical in SEV-SNP setup, especially for Kata Containers and similar - 
> the initial launch measurement is a natural indicator of the target 
> environment. Kexec basically allows them to completely bypass that: You 
> would be able to run a completely different environment than the one you 
> measure through the launch digest. I'm not sure it's a good idea to even 
> allow that by default in CoCo environments - at least not if the kernel 
> is locked down.

Isn't it the same when we just allow loading kernel modules? I'm sure
you can also achieve a 'completely different environment' with that :-)
With SecureBoot / lockdown we normally require modules to pass signature
check, I guess we can employ the same mechanism for kexec. I.e. in
lockdown, we require signature check on the kexec-ed kernel. Also, it
may make sense to check initramfs too (with direct kernel boot it's also
part of launch measurements, right?) and there's UKI for that already).

Personally, I believe that if we simply forbid kexec for CoCo in
lockdown mode, the feature will become mostly useless in 'full stack'
(which boot through firmware) production envrironments.

-- 
Vitaly

