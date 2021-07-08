Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24272
	for <linux-coco@lists.linux.dev>; Thu,  8 Jul 2021 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625734417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gIPcM/AEt6CFgVLe5U5Gt1G0R6Bu5ZtRDH8h8xxqSLM=;
	b=KXwSInhQgEedCjB/DSIep/L7vAWpFG7AN4u5+Q8sEeAY/ED+I5amzsxPA5PVEKPwYvQHLr
	QBebv5J98NNnHZ6EhYmApYz06KQgNz3p38I5fWlExibv2AS2jyHcdfe0RdweCfyRckgffo
	5O0Li2LjV6j/GOTt0tP0oHihu9ge354=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-SF_yuSWWMFK026zzmo1rdQ-1; Thu, 08 Jul 2021 04:53:34 -0400
X-MC-Unique: SF_yuSWWMFK026zzmo1rdQ-1
Received: by mail-ed1-f70.google.com with SMTP id j15-20020a05640211cfb0290394f9de5750so2898668edw.16
        for <linux-coco@lists.linux.dev>; Thu, 08 Jul 2021 01:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gIPcM/AEt6CFgVLe5U5Gt1G0R6Bu5ZtRDH8h8xxqSLM=;
        b=E2tMm0MTIXHBTL75M0r3C9l8X0GK6sfg86uSKJrqZkp2yCiuM4BvocJXbEJtPsOZfT
         7QSEA97+TBjAU1cClyEMWnjMDFJykexVvgisEfTjw4TzxUJRwUFDwa6Gx3p5H5PYrDWn
         Bg8OZ+P68U7gNgMal3zj6XXu47aW1En90qZ6dLj+9QA//rzqG210UiIwOiRqir4XenVz
         POx1RRUBwtA/8eSEeCY49G77FgRAEvVE4Lnrsu5Az4riS0V+svq/nyX+hmuHTFTPsVfz
         ly4INPQ5+4KD6ACV1AgfTtO7V2xU8egiUdllmhnh23RERT52/PevZxVZ3MekmKruRwjz
         6rvw==
X-Gm-Message-State: AOAM530qLH2qDnrxJfjys/Cc8I6ehkntHHhyg79RIO4VAEiGEPAqKiTS
	BhsW2jpKj+YhHJeF1ihLg+mjLcCOoOnAUt9CShfi0xOJ1LIaddr2+EBodenX6RepCHt5fe8YSVw
	8aYM22llB2w7NcGauE/s+Iw==
X-Received: by 2002:a05:6402:1014:: with SMTP id c20mr36763742edu.380.1625734413612;
        Thu, 08 Jul 2021 01:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx/+0c8nIU7pwYBojXCHzTNcV8ZCk6Cqibqq/t9wTBQKxs+CGQcGK3UP/Yf8+cmhDD/LkdhQ==
X-Received: by 2002:a05:6402:1014:: with SMTP id c20mr36763691edu.380.1625734413381;
        Thu, 08 Jul 2021 01:53:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id u17sm853904edt.67.2021.07.08.01.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 01:53:32 -0700 (PDT)
Subject: Re: [PATCH Part1 RFC v4 04/36] x86/mm: Add sev_feature_enabled()
 helper
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ard Biesheuvel <ardb@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>,
 Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>,
 Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 tony.luck@intel.com, npmccallum@redhat.com, brijesh.ksingh@gmail.com
References: <20210707181506.30489-1-brijesh.singh@amd.com>
 <20210707181506.30489-5-brijesh.singh@amd.com> <YOa8TlaZM42+sz+E@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e6c68c70-ac6e-07f2-c24e-f1c892080eab@redhat.com>
Date: Thu, 8 Jul 2021 10:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YOa8TlaZM42+sz+E@work-vm>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/07/21 10:50, Dr. David Alan Gilbert wrote:
>> +enum sev_feature_type {
>> +	SEV,
>> +	SEV_ES,
>> +	SEV_SNP
>> +};
> Is this ....
> 
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index a7c413432b33..37589da0282e 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -481,8 +481,10 @@
>>   #define MSR_AMD64_SEV			0xc0010131
>>   #define MSR_AMD64_SEV_ENABLED_BIT	0
>>   #define MSR_AMD64_SEV_ES_ENABLED_BIT	1
>> +#define MSR_AMD64_SEV_SNP_ENABLED_BIT	2
> Just the same as this ?
> 

No, it's just a coincidence.

Paolo

