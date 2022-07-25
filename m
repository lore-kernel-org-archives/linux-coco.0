Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F738F
	for <linux-coco@lists.linux.dev>; Mon, 25 Jul 2022 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658752742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3WHFuKmZPQedoN55ZoH0FtL+rcxDT0vItFUzM4he2I8=;
	b=XdVuorXcX3UyPmS6Mpnf0VZc2RmgGmB9OIc+vj3gqOyDQJlLHIT1DLzffEtVFoDl3+ekKe
	PPUKhHKPrSxYttXJ2lVB2tBlCENlOjxtf8bG+EnEpINAtqXuZCVJFYi7Bwi8DKHOkbAaav
	aBRaNvU2qjsThva9Zx+16hz2AFPjeYo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-VEUjr7aFPUejZsL17KJAWA-1; Mon, 25 Jul 2022 08:39:00 -0400
X-MC-Unique: VEUjr7aFPUejZsL17KJAWA-1
Received: by mail-wm1-f71.google.com with SMTP id h189-20020a1c21c6000000b003a2fdf9bd2aso6112456wmh.8
        for <linux-coco@lists.linux.dev>; Mon, 25 Jul 2022 05:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=3WHFuKmZPQedoN55ZoH0FtL+rcxDT0vItFUzM4he2I8=;
        b=HXqsXr+40Cp3vmkkDnutPrWaUMQ//i3zErJOy3dDU8dLCkbyxYyLldbC5jCmxaqE/R
         qrI6kOnZ4Xky2FnjpqrbGxBErOF6bJw2ZroABpkedClf+pUDcwuJLtJ3sbCF+TrCQBHk
         3n91Hnx1PFsjJmY8DzC07hFue9sbbyE5GYwJsLBYqqMZU/uagSrUVu9lbaERX2uAnGNt
         vHhlmoBXYackBNodmYnoS1EVoK9zzly3yhD1ThsT19APRiMI6Tw/Zf1dVqXtGN6mHGLy
         o7rsTyn0O8HEYSMR28XPE0i5FvO/vkYtDnJCTlW5CGMgdf8od2/HkQZfZ3b8P07QVD5I
         EzHQ==
X-Gm-Message-State: AJIora/J6jqEnJl3xA6RbQXpOLbve1Jtq5TPNL48oOp5DDaUEBuy7eL8
	OV+eb9cwZ7amAaoaBjK4iPL0yaPb+Auf5BOjHGuwLk5pQ9H79raC2LbF5GZdogU3Zh5HVpYChH1
	lwThUvmILXc83RZIhAX4Izg==
X-Received: by 2002:a05:600c:1986:b0:3a3:490b:1fd4 with SMTP id t6-20020a05600c198600b003a3490b1fd4mr7365121wmq.140.1658752739742;
        Mon, 25 Jul 2022 05:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTnXfTssXHtYtWUqP9z+lS8oior8tLmN08lGBELo1Up+/gD5Avnva+lrhKtPOFyww/a8mGKA==
X-Received: by 2002:a05:600c:1986:b0:3a3:490b:1fd4 with SMTP id t6-20020a05600c198600b003a3490b1fd4mr7365095wmq.140.1658752739261;
        Mon, 25 Jul 2022 05:38:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:8c00:eee4:63f0:cef2:5ac0? (p200300cbc7048c00eee463f0cef25ac0.dip0.t-ipconnect.de. [2003:cb:c704:8c00:eee4:63f0:cef2:5ac0])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm11691804wrv.94.2022.07.25.05.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 05:38:58 -0700 (PDT)
Message-ID: <7d664831-a78c-4a4f-5bd6-f0e04463ca7c@redhat.com>
Date: Mon, 25 Jul 2022 14:38:57 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv7 02/14] mm: Add support for unaccepted memory
To: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Mike Rapoport <rppt@kernel.org>, marcelo.cerri@canonical.com,
 tim.gardner@canonical.com, khalid.elmously@canonical.com,
 philip.cox@canonical.com, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-3-kirill.shutemov@linux.intel.com>
 <YtltYRuL+2uQkYUK@zn.tnic> <ebcf2979-45fc-8d41-cc28-ac8da0d24245@intel.com>
 <Ytr4FCV2xPGUBLqs@zn.tnic> <707ca113-c2a2-8fe2-a22c-5be13adc7bb4@intel.com>
 <Yt6LOD9Ae2NqyG1N@zn.tnic>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yt6LOD9Ae2NqyG1N@zn.tnic>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.22 14:23, Borislav Petkov wrote:
> On Fri, Jul 22, 2022 at 12:30:36PM -0700, Dave Hansen wrote:
>> Sure does...  *Something* has to manage the cache coherency so that old
>> physical aliases of the converted memory don't write back and clobber
>> new data.  But, maybe the hardware is doing that now.
> 
> Let's hope.
> 
>> Yeah, that two-tier system is the way it's happening today from what
>> I understand. This whole conversation is about how to handle the >4GB
>> memory.
> 
> Would it be possible to pre-accept a bunch of mem - think "pre-fault" -
> from userspace?
> 
> I.e., I'm thinking some huge process is going to start in the VM, VM
> userspace goes and causes a chunk of memory to be pre-accepted and then
> the process starts and runs more-or-less smoothly as the majority of its
> memory has already been "prepared".
> 
> Or does that not make any sense from mm perspective?
> 

The less core-MM code to handle unaccepted memory the better. Meaning,
that any kind of additional pre-acceptance (in addition to what we have
here) needs good justification.

-- 
Thanks,

David / dhildenb

