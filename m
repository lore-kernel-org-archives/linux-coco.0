Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05303FC2
	for <linux-coco@lists.linux.dev>; Tue, 31 Aug 2021 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630440944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+3bK63F6vZV9gF02enJmq1IwAzxVldbfTOh+NENPz4=;
	b=XAIS078aFLvwDF9G6Pq+DoRdW806EK+1YyqapSPR4RbRQ4m5M4eHx8Doq6/Dpvjp96kZZd
	rwbCWoxbypHEe3ztVIAe9A1k+F0rW+bEHbr3ytQuLl6MBvcvCAIeoZ9I2QH0Tapog+B8lI
	1Xr3PYyIkvZ8WczI8fEMdqpwp1DJrD4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-4qJqLjk1Mm-s6ghD2POLGg-1; Tue, 31 Aug 2021 16:15:43 -0400
X-MC-Unique: 4qJqLjk1Mm-s6ghD2POLGg-1
Received: by mail-wr1-f70.google.com with SMTP id u2-20020adfdd42000000b001579f5d6779so214769wrm.8
        for <linux-coco@lists.linux.dev>; Tue, 31 Aug 2021 13:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=g+3bK63F6vZV9gF02enJmq1IwAzxVldbfTOh+NENPz4=;
        b=KIegvlwIKVEr0Y0frLbyprnxwcpt5xFoUy1gOkDMsDSlKHKDb8pye6g8d1NW/dd7Fs
         Td23h696cVD6x7yUuyL/cwGc7VBHBqsUWfIRRKxHjVHKYEQuZottrA8k+7yWzhZLt38N
         A2KXnT4kvWGZAzJBSrqQMKy3mj7hpo49sna89CVgwpErYgtCFZvp5HyZYuJNMzP2z+Xd
         wOkf0GqingjWit828J/1IF3tksfWf+GKqicUaKKqV0OchGXGR3muM6EtzpisWIHbW2yT
         QmAw/jzGcmSYyc9CH9svBsBSC5O7JZwtfe7dcUhlcuyBARopyyLYRNP0TOy6WE7pbRT1
         GCtQ==
X-Gm-Message-State: AOAM5325ZCh4ljfIzwJKOLX5Z8qS1RVvkXxlFeih7SqsmeyWNwdO+FpO
	vCio7/TMcKIy16fB8yjgILifUKybIOgqDS8QVbrHeG1HP52WzgbiiwAAmcwt+Dyd6sFUjnpcOeX
	ob3LUp/lf531qZ38owxdp+Q==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr6178325wmc.30.1630440942385;
        Tue, 31 Aug 2021 13:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB2RQAmO5BS/DvOxJgqehQUn6XNwZTVP2aL40tssuajSfi8Q5/tHrZmF44xOFZj1btCjBABg==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr6178303wmc.30.1630440942231;
        Tue, 31 Aug 2021 13:15:42 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bf5.dip0.t-ipconnect.de. [79.242.59.245])
        by smtp.gmail.com with ESMTPSA id p11sm3438168wma.16.2021.08.31.13.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 13:15:41 -0700 (PDT)
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
To: Andi Kleen <ak@linux.intel.com>, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <307d385a-a263-276f-28eb-4bc8dd287e32@redhat.com>
 <20210827023150.jotwvom7mlsawjh4@linux.intel.com>
 <243bc6a3-b43b-cd18-9cbb-1f42a5de802f@redhat.com>
 <765e9bbe-2df5-3dcc-9329-347770dc091d@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <4677f310-5987-0c13-5caf-fd3b625b4344@redhat.com>
Date: Tue, 31 Aug 2021 22:15:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <765e9bbe-2df5-3dcc-9329-347770dc091d@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.08.21 22:01, Andi Kleen wrote:
> 
>>> Thanks a lot for this summary. A question about the requirement: do
>>> we or
>>> do we not have plan to support assigned device to the protected VM?
>>
>> Good question, I assume that is stuff for the far far future.
> 
> It is in principle possible with the current TDX, but not secure. But
> someone might decide to do it. So it would be good to have basic support
> at least.

Can you elaborate the "not secure" part? Do you mean, making the device 
only access "shared" memory, not secure/encrypted/whatsoever?

-- 
Thanks,

David / dhildenb

