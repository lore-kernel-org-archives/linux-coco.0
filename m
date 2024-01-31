Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C12B55782
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686287; cv=none; b=cr6KmrN7/KA7fMGTqIJU3qHc3bgZO9jGdbZkJEytjRj/L1RuTQM3FfkbZPoP4DH7BQNWv2bk2MB1E35G0Yavzz8DOkyy8/2yI9dA2Hefkf7WOdTv2NpE63ocYjac2Aad1KnHTneP2aEmYKjunNzeNXHj/7b8yNcTqNQI42E9DZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686287; c=relaxed/simple;
	bh=qam7HRULEOr6fNQvTRT8ZVpRJTxiJi5JDfLfsxZxk68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5oDgFUybyXh7oFShe2gIONv0X9Ia5xfUq7h0eVfgzbgrq7EzF5JzL9HG9CTlsYn5JPdiiYttCinRHBAeuTawR0ge+yIVzoboA0Jv+NdPOnr5QSoPp2KKPBElTwjZtG5YpIKq2WVXs05kmj2ySdfqOPkbnjRX3ghT+dJGb1HQ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cXnjXuww; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cXnjXuww"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55ee9805da7so4142080a12.3
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 23:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706686283; x=1707291083; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgLPIeASAe7o9WjBABzOsB7qU2IyoTbg5XdoUZ2fWs8=;
        b=cXnjXuwwJWnf2RGSjZa0dsiIUNb4VLWIZVwcbBV6g2KlmljKHMTWuyaudlLLUj0xvT
         95mexoB+WYfZQ1Uet9lBFwNtBfYwypnxK4aOwkrXg3f3+6orp0qxqSSZAHbLkZFTCNkZ
         pqR5Aj1XFbOnKwdEbNzer194nwio4ZNdP38jaRKnrtdY0FM9oYLtZ7fefZ5AX+3r7cJe
         +Rs7TIlqRyt0sxxcBbmmwhFNdsT+Y0nWiCFzL9PLdZ4tnvy/DW9d2kJGOJ8toEHEWT5S
         3Y5yJnUzSKUje/spYdMb1XIQBlfkDX4FVDDwxuMkbaBMortaAG0n9j4LAkMTTlg3HSH+
         GcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706686283; x=1707291083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgLPIeASAe7o9WjBABzOsB7qU2IyoTbg5XdoUZ2fWs8=;
        b=Fd1SshNN6ZV3h6A/HVrEzBQTn2aEwqtsujTA2CuleKvT97lN3hDkDtEN5angyYPlaZ
         mwdJROYPv3L4CaBKnTmzid0YgVKLbAyeHYF1sBUUUGV3LtePZpGbW69QvROVk1WOp84k
         SM1T+ODyxHz0ouTTycNyczq4UePLYsDlYek+9tIgluffi8kI8wPGROZHTp1ehAv1Qf61
         Mm3LKbWIKwk8uZOepCF8BDsK7s4dEh7cRYCwg2WrTgcZjwLkm3wWeE4gZsC6IhGC4tbJ
         BhiZ17hY9Gamv9aNXIKHUOkkUGjr32124lZQuGM+kBJF+CDSoUleWkMXVOF9bFMeiCvo
         /qnA==
X-Gm-Message-State: AOJu0Yx6UUD///XUdjLA2fruG8/Curw+pYRXhKKgxSZo1PjXUPJllgiG
	ooZdpie5jAqPxr5LoI6Jk2COTLwF6Lm6uCd18BZo0R4MCRk+EX8hBdYEOacMPrU=
X-Google-Smtp-Source: AGHT+IGPzOcdc3+8Kb0Rxv3ybitEJMCoQK5tB6gdp4e+UqRtfJmhKXIVnjnDfIu++uawgiS1GLjYKw==
X-Received: by 2002:a05:6402:f93:b0:55e:ed35:ffce with SMTP id eh19-20020a0564020f9300b0055eed35ffcemr427085edb.37.1706686283355;
        Tue, 30 Jan 2024 23:31:23 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f? ([2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f])
        by smtp.gmail.com with ESMTPSA id d32-20020a056402402000b0055f82f799dasm323865eda.66.2024.01.30.23.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 23:31:23 -0800 (PST)
Message-ID: <efe20a00-9a7c-4c03-8fcc-fce265cdbf0e@suse.com>
Date: Wed, 31 Jan 2024 09:31:21 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 00/16] x86/tdx: Add kexec support
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240124125557.493675-1-kirill.shutemov@linux.intel.com>
 <3f44458f-2b4a-4464-a3df-cb791298dafc@redhat.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <3f44458f-2b4a-4464-a3df-cb791298dafc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30.01.24 г. 15:43 ч., Paolo Bonzini wrote:
> On 1/24/24 13:55, Kirill A. Shutemov wrote:
>> The patchset adds bits and pieces to get kexec (and crashkernel) work on
>> TDX guest.
>>
>> The last patch implements CPU offlining according to the approved ACPI
>> spec change poposal[1]. It unlocks kexec with all CPUs visible in the 
>> target
>> kernel. It requires BIOS-side enabling. If it missing we fallback to 
>> booting
>> 2nd kernel with single CPU.
>>
>> Please review. I would be glad for any feedback.
> 
> Hi Kirill,
> 
> I have a very basic question: is there a reason why this series does not 
> revert commit cb8eb06d50fc, "x86/virt/tdx: Disable TDX host support when 
> kexec is enabled"?

While on the topic, Paolo do you think it's  better to have a runtime 
disable of kexec rather than at compile time:

[RFC PATCH] x86/virt/tdx: Disable KEXEC in the presence of TDX

20240118160118.1899299-1-nik.borisov@suse.com

I'm trying to get traction for this patch.


> 
> Thanks,
> 
> Paolo
> 
> 
