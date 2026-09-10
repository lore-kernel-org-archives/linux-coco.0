Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE035202C
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033234; cv=none; b=bMWAFk/Oq/hP/Z0/6dasBWC9jzC6WnA18Tlvht0vNxA6TdyIxXTUbcBrah0+fJUZn1YGdLqJ2YwrXMojbSmyBcmbtkP1qd7fpril6Mj7p45GbTRqEFJHs418ELz5K2ghboYCY6SRtExNh4ziEL3p29Qr0HnV09Amupk+RzLz1Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033234; c=relaxed/simple;
	bh=2U05edltdc65w78+ZV5IWr4TVwXUEOtUfX+tKTehz0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B05am/rnSPP8he2jU27sb6kyn77J3tEzflEk/bofnHeHA5/2tnmoxiF4TH3wcvgeS+8GYZHDCDZ2c15zd7OrciKQtmKQh9Y/qEGArFCe37HHzI9JYDoALe4HYrxib2kkuUzSROabvcYkpTLC5PSNhDu4kinmuUXpQ6GHVTfPOYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZGJO44Io; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZGJO44Io"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789033230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=;
	b=ZGJO44IoGli0HFlpAhcx0E69xg+EVUw9NlR0hdrC1sqGigkvL/nzQ1awTTUEgDm2T5EJAZ
	Yh01foWG88StMMbtr8N9AREBMQ67XrI8i19RCV5drhfYHwrf47dSBaF9uSb7qoOuRhAxfR
	HZKQYvGMuY4Maw9Iz8hoSCEt1d9Rsw0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-1bkv7sXtMc-4n4u1FYbzww-1; Thu, 10 Sep 2026 05:40:29 -0400
X-MC-Unique: 1bkv7sXtMc-4n4u1FYbzww-1
X-Mimecast-MFC-AGG-ID: 1bkv7sXtMc-4n4u1FYbzww_1789033228
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db050d469fso12266785ad.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 02:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033228; x=1789638028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=;
        b=BT7jCaU91c320VUK54EKjiL0oa/PsLOxsf/K1gny1tlXcwHWVpUylSuQY36dKHNTMG
         AkqPIK6/JoBAvuipqO/JT0aNFFtf7EJbiMBHvzZzpG+ZhmmJ1UxXEj/9dAuzmi5iaEsv
         2R0QgeLfVfRknCtK50pAaOnkRRqR07iXV/aBPB7KJ5jWkBMpgVUtkMfRpITLnCybypxr
         sBEK+keFAVpJfGdZLn8g8EyNxobXpnDcFbRFl1Abbx6MDQOn+F2SzTlhLb/uFOqS8UeL
         /v+afLdWF64tBsJp2nvqzzxuX1/RRFIPQ7H+RA5ODFgAnOQduYd6C0SrSLMZUO03hYhR
         G8hA==
X-Forwarded-Encrypted: i=1; AKwUvBwwWtcPMVkMHD0uC3wvUmf17lWYLxvbCsyoxygKqE+T3wJCXLozY0sOBh5yg8180MH/INfc7lKIVsvS@lists.linux.dev
X-Gm-Message-State: AFuF++nmfcWWh2mFT5wubFpd1FLf6msZe1p44MZZD8gZBG4iEn0U0R9I
	/Z3WrOhXHAcZdxtFxWRtHEnA+jcmbToiOj2rF/UntzAxRfZkVwT8DjbPaFElaB6QfWSdCDcubmG
	/0M+fBeWREmHITihSbC7y44Yr1tRHqUJ7OBur9s1ek6vfAyfkDqSRn6BRKnFewbI=
X-Gm-Gg: AYBFou1O9kPam++Xq3KCwdbMMxHoP6OhAYvvcljIqZKywj5i6XP2oFT7bYV7CpXFjrY
	g3EBoMhvV9/Hq1LTqTL2rKHkwmw1yBD1fKdS3hYsjCD+biYqPBDFil4jmmy3RsI4dv91WBDzJQ5
	xnViKcODokARFPKblIoJtvscX6yqS8L1U4iOrcDv/Muxvbrg6AyAd83cWH18XtUwSQ9GCOzqlU4
	ruwRlz+lcskJS93P6PfIoWH3QYUXiMgx/2UdqoNGt2C6D7PsjTi4KCafm77XZCC2GAZmPFpXjin
	Bu69jsBzLeMsmiiOzu+EqaJI60e/nVELR0cnAqiRQwCoHHqbStyooGaorvnkaz1bK7dC6e56g8v
	hOvoouh68Nmr1LwD/YInSZ/PjJMal65t/FYlnZX8aaw==
X-Received: by 2002:a17:90b:4490:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39d77a08755mr3066649a91.5.1789033228090;
        Thu, 10 Sep 2026 02:40:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4490:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39d77a08755mr3066617a91.5.1789033227578;
        Thu, 10 Sep 2026 02:40:27 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d80f0068esm3343502a91.10.2026.09.10.02.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:40:26 -0700 (PDT)
Message-ID: <472daa5d-19e5-41f1-9650-44e0245bc1f0@redhat.com>
Date: Thu, 10 Sep 2026 19:40:13 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
 <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
 <40d3312a-c695-44ed-857a-fc6bf293f3e6@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <40d3312a-c695-44ed-857a-fc6bf293f3e6@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2H_gEzMZw0xeyw3G1VzmqFKU89m8J5tjd8xQGW76xSo_1789033228
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/26 6:43 PM, Suzuki K Poulose wrote:
> On 10/09/2026 06:53, Gavin Shan wrote:
>> Hi Suzuki,
>>
>> On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
>>> Add an explicit mode to support Arm CCA guests.
>>>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>>>   arch/arm64/include/asm/kvm_host.h               | 1 +
>>>   arch/arm64/kvm/arm.c                            | 5 +++++
>>>   3 files changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/ Documentation/admin-guide/kernel-parameters.txt
>>> index 68647ff4bdd24..1afe3df3b923e 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -3256,6 +3256,9 @@ Kernel parameters
>>>               nested: VHE-based mode with support for nested
>>>                   virtualization. Requires at least ARMv8.4
>>>                   hardware (with FEAT_NV2).
>>> +            rmm: Support for running confidential guests in Realm
>>> +                 world using RMM, as defined by Arm Confidential
>>> +                 Compute Architecture (CCA)
>>>
>>
>> I'm not sure, but 'realm' would be more appropriate name. rmm (Real Management Monitor) is
>> the term limited to the firmware to me. Besides, we have been using 'realm' broadly in this
>> series like kvm_vm_is_realm(), kvm_realm_state() and so on.
> 
> May be. But we use the "mode" of the hypervisor in question here, mostly. e.g., nvhe, vhe, protected etc. So, I went with RMM (in favor
> of CCA). Does that make sense ? Also, we rely on firmware/arm_rmm for
> the support. So, it kind of make sense to keep it "rmm" ?
> 

Ok, lets keep 'rmm' unless somebody else has better suggestion.

> Cheers
> Suzuki
> 

Thanks,
Gavin

