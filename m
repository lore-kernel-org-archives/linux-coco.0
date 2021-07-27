Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236E370
	for <linux-coco@lists.linux.dev>; Tue, 27 Jul 2021 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627378491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/cFvdqN4Xj3DXMYOW7cFjJJMvqSl7T8o3BRKuSQ8nA=;
	b=CgkfE0aSpM2IHgOBLWS41c3u95QcRnn7zYFoRPplHgKBht1yDMNbWiJ3x4iAJ/9CUBHZcx
	viqsNT6tJxUp+dyRfnE8u/BSutbq1WEYuMRBqmpP7Jtj52/oCFsPzYq7WAYGODd4CllGbW
	3stVx/CmC+aNbnUZcw/JVnfCJNVt7w4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-vWAFrEFHP3yskZ_qbuEHZw-1; Tue, 27 Jul 2021 05:34:50 -0400
X-MC-Unique: vWAFrEFHP3yskZ_qbuEHZw-1
Received: by mail-wr1-f72.google.com with SMTP id p12-20020a5d68cc0000b02901426384855aso5752568wrw.11
        for <linux-coco@lists.linux.dev>; Tue, 27 Jul 2021 02:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=x/cFvdqN4Xj3DXMYOW7cFjJJMvqSl7T8o3BRKuSQ8nA=;
        b=TMfli+BskMdmgr2yUKp5Yy1jf8pWza/GV3BNcp50QqG/xDjYp1XANrLIKsxiMsQebZ
         /O6Ks+F9KWS5LTvVaXlVDiUQTmrKzfq4vJ5yEFUA0fZ6DOrPL/BtHam6oa4b286Jp2Tp
         oP5+fOODDS2IvjHhsCCUmyQEbEcLU1BpnNxYGz6W4t5jwT23VW79/CPkskFF393SlYTJ
         jnokSCeQZ3kKepifJQRPyXY0HqeXqm5Kk7M0f6bLwQChljLCoKkPnxJGxg8drROLot3h
         24E0S/0oBJIDstYJtpLz3JT5Cv32sdSJ9RY1SaINniP9HadREiRmQwHrQeDnEa/WxgGW
         D/pQ==
X-Gm-Message-State: AOAM531mUqYeh8w1SdYPQJ7C+S1uWRbywwt9O67jm1PHRb7Ic2mvILqx
	3AckftIjZreH3lZoCGby8BQmdUitbLFI+NSslFQYqc11S5Pyo2PGRQmGLybwqnGGERreB2l2sT4
	XQOF/AXItFs57NPMNmkOWsM2KeLGrygCBJ0o0d8BMQJxTF66+pTuWZ1TVuB0rq2aUCwt4ug==
X-Received: by 2002:adf:b605:: with SMTP id f5mr23592948wre.419.1627378489584;
        Tue, 27 Jul 2021 02:34:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMhj+gPGT7Vs/guH6NirDuDBBJ1uaMH6gd689xxXSmfgwWK++/1jGSao4aWIp6ioeNMcszyQ==
X-Received: by 2002:adf:b605:: with SMTP id f5mr23592900wre.419.1627378489249;
        Tue, 27 Jul 2021 02:34:49 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
        by smtp.gmail.com with ESMTPSA id b6sm3204580wrn.9.2021.07.27.02.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 02:34:48 -0700 (PDT)
To: Joerg Roedel <joro@8bytes.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam
 <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <fa38e74e-e7ca-39f3-f2db-f0a0de152edb@redhat.com>
 <YP8G1EuMPk1U40kz@8bytes.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <023d2435-8cc7-dc44-6258-4135136ddfba@redhat.com>
Date: Tue, 27 Jul 2021 11:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YP8G1EuMPk1U40kz@8bytes.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.07.21 21:02, Joerg Roedel wrote:
> On Thu, Jul 22, 2021 at 05:46:13PM +0200, David Hildenbrand wrote:
>> +1, this smells like an anti-patter. I'm absolutely not in favor of a
>> bitmap, we have the sparse memory model for a reason.
> 
> Well, I doubt that TDX or SNP guests will be set up with a sparse memory
> layout.

What makes you think that? I already heard people express desires for 
memory hot(un)plug, especially in the context of running containers 
inside encrypted VMs. And static bitmaps are naturally a bad choice for 
changing memory layouts.

> 
>> Also, I am not convinced that kexec/kdump is actually easy to realize with
>> the bitmap?
> 
>> Who will forward that bitmap?
> 
> The kernel decompressor will create it and forward it to the
> decompressed kernel image. The running kernel will pass it on to
> kexec'ed kernels for the lifetime of the system.

How will the second kernel figure out the location? Similar to how we 
pass the physical address of the vmcore header via the cmdline to the 
new kernel?

> 
>> Where will it reside?
> 
> In Linux kernel owned memory, location decided by the kernel
> decompressor.

Okay, owned by the old kernel, not initially mapped by new kernel in the 
identity mapping. Is there a prototype/code that implements that?

> 
>> Who says it's not corrupted?
> 
> If the hypervisor corrupts it we can notice it. The guest kernel can
> corrupt it on its own, but that is true for all data in the guest, also
> the memmap.

Yes, but it does not affect the kdump kernel booting, only makedumpfile 
might bail out later when it detects a corruption.

I'm wondering, why exactly would a kdump kernel (not touching memory of 
the old kernel while booting up) need access to the bitmap? Just 
wondering, for ACPI tables and such? I can understand why makedumpfile 
would need that information when actually dumping memory of the old 
kernel, but it would have access to the memmap of the old kernel to 
obtain that information.

> 
>> Just take a look at how we don't even have access to memmap of the
>> oldkernel in the newkernel -- and have to locate and decipher it in
>> constantly-to-be-updated user space makedumpfile. Any time you'd
>> change anything about the bitmap ("hey, let's use larger chunks",
>> "hey, let's split it up") you'd break the old_kernel
>> <-> new_kernel agreement.
> 
> Im not sure if makedumpfile needs to know about that bitmap. If we
> mirror the same information into the memmap, then there is definitly no
> need for it.

Mirroring is a good point. But I'd suggest using the bitmap only during 
early boot if really necessary and after syncing it to the bitmap, get 
rid of it. Sure, kexec is more challenging, but at least it's a clean 
design. We can always try expressing the state of validated memory in 
the e820 map we present to the kexec kernel.

-- 
Thanks,

David / dhildenb

