Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40101FA1
	for <linux-coco@lists.linux.dev>; Tue, 12 Apr 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649751521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HjEpVaoQD5ARkUa//p08UmNnQm2oDsvimQB15pvFtYY=;
	b=bPOC9kUJNqI2ava9aRRxRCQirYFE5zk4SnrficGS5uhTc+YiZ9YuDFOoorYGorXeJqgjdp
	S/W0+6XEMHhYeD7xryE97qAfxpNkcdxagoglFLtmHnnueuWRU0L9Dc0MyfSbqYdshpu344
	v7ZiLEaYyLldDPae6VXd2sQol8Qp7dc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-UL-xZpjgNImG4CmPn93iwg-1; Tue, 12 Apr 2022 04:18:40 -0400
X-MC-Unique: UL-xZpjgNImG4CmPn93iwg-1
Received: by mail-wm1-f69.google.com with SMTP id f12-20020a05600c154c00b0038ea9ed0a4aso947014wmg.1
        for <linux-coco@lists.linux.dev>; Tue, 12 Apr 2022 01:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=HjEpVaoQD5ARkUa//p08UmNnQm2oDsvimQB15pvFtYY=;
        b=Mug5Zf62AZ6iWVlLJoqEJtcmVJbcHXIgb0Gp26RV2/V5tmY5sD/ig1SZwY3qagahIJ
         0VGlxU7yGpD/DB2KS03pN08nAXnFivRPHdhxjzxfbwWiBOV9XXhnicAUz2FMCtFmsxh6
         Yi/UUJprlUopOSrCrbOFLPplB9OBdQoCdl0Wmg41LAQA8aH9XjOh3bT606NakjMM17bi
         NwmNPeQm9Sgn3Vj6DoOBfw0fecU/dyR4a2gKp+K6LzDpHgh9+AaQfFvgIEwZpLqcB1ho
         eAajJxvB8RbH3QWyBwm2d8cIpVQ+O55swTYwcr7tZZRmNcg50FVdgYNUnJyEJlMYct35
         RhGQ==
X-Gm-Message-State: AOAM5317TJv0llhgxVMwmQK2beOS6OQSXdHqWQS/23c2t1AmtUe71zIz
	kO5JzAsvPQ9v4zDk8JLLLnCbylNF9EM+WQCeiX/qi4ypTyNhsbePN6T/Vls5g/XboSYKYrhRRnK
	/yQLaXz5OYzONMKcdY7rYlg==
X-Received: by 2002:a5d:47cc:0:b0:204:1c9d:2157 with SMTP id o12-20020a5d47cc000000b002041c9d2157mr27253321wrc.294.1649751519276;
        Tue, 12 Apr 2022 01:18:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtAJ2/UNdxCVTBdsyo9WuJJCk5rWPxBJRneEzkaBvsDA/8B/+o2maXYXbvtqtOlUtJh6R1kg==
X-Received: by 2002:a5d:47cc:0:b0:204:1c9d:2157 with SMTP id o12-20020a5d47cc000000b002041c9d2157mr27253303wrc.294.1649751519001;
        Tue, 12 Apr 2022 01:18:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1800:7c14:16cc:5291:a9f3? (p200300cbc70718007c1416cc5291a9f3.dip0.t-ipconnect.de. [2003:cb:c707:1800:7c14:16cc:5291:a9f3])
        by smtp.gmail.com with ESMTPSA id k13-20020a7bc40d000000b0038e9edf5e73sm1959421wmi.3.2022.04.12.01.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 01:18:38 -0700 (PDT)
Message-ID: <b3a221fb-2382-5b19-4fbd-031629d641fd@redhat.com>
Date: Tue, 12 Apr 2022 10:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCHv4 8/8] mm/vmstat: Add counter for memory accepting
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Dave Hansen <dave.hansen@intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Mike Rapoport <rppt@kernel.org>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-9-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220405234343.74045-9-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.04.22 01:43, Kirill A. Shutemov wrote:
> The counter increased every time kernel accepts a memory region.
> 
> The counter allows to see if memory acceptation is still ongoing and
> contributes to memory allocation latency.
> 

Does it? See my other mail, can't we have the counter essentially not
changing for a long time but still some unaccepted pages sitting at the
tail of the freelists that will only get allocated+accepted under real
memory pressure?

-- 
Thanks,

David / dhildenb

