Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2B972
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 22:09:33 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id p36so678991pfw.11
        for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 15:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g1KpDtcbagCdJ8ZcB9ERipK82kYWQJWAaZ7siOAOkMw=;
        b=iC5/q3Dl6pQ0rDuXXIFsUAbTTQ6Y1iAmt2YRVwiDFilqazfKQ9eEEPIayC2+XoUaT9
         usur5pgbsW0fNlZwnXjGODqmC21M5aICjnd0qHR+a8GO8IcdohO4/jlCmYaIlbW9IpQ/
         9icYBfvLFjmRAGsIv2RA8ekw4kWlpmiVwY66u3OydYL7Z53+N5wZpVGiQAecWFBlLpLe
         sL9R9oq4gKRFUvlIZCwk423cdnRZmAN89qaHYNxWqXrQ1h70ThRegG+2GEW+VV4D7E6W
         We1DWyHavLAYbXFybe4gmSLh43r2YhL50quM4zqfHfvjJeqPygE3Sbq/iA1L8bSDsgIo
         MW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g1KpDtcbagCdJ8ZcB9ERipK82kYWQJWAaZ7siOAOkMw=;
        b=feOyFdQhnGNp73MnKDzoDTxHwz5F//RZz7owqmg88rBQJN9/AgY31TITezm3ZGpUl9
         OuUb3WXBVu3a8dB8eTPrV7Qh4ZIyH0KkYca7oZ6JSzuLAc7xE5XJarnEIsfBrbOrKLy2
         wDRpd1V/dgror40S1C1HmIPxlREyZNlm9MZzqFnMi1Ad2/s1HG/rhphZArhZAOvhC5HL
         G+5NefFXfpiFbV6KVXu1qBtzY0XVASg8OuRWm2JLsPKKo4pwys0unMSbal9kW597xVnk
         MvTTUxyqvGBjW8AD0mZml52jsdsD1k9UbbUEp97JW/o53s252SjzVxEj4y97EE+/TMnx
         h62A==
X-Gm-Message-State: AOAM531Fgzs2VAsz84l8shKJSWnlIL4ZZ+t7RAMFoJC8rdRmcX3RwpaF
	Kl/33QEB564rIGyW7EYLRmFZ2g==
X-Google-Smtp-Source: ABdhPJx8WtrWjs7nIJb96K+K/6fJyf4kxrPOkag79GDpR0/USJYJ5ph8uncx7oovExjawasHg85EEw==
X-Received: by 2002:a63:5059:: with SMTP id q25mr32834341pgl.9.1626818972887;
        Tue, 20 Jul 2021 15:09:32 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id p5sm24369675pfn.46.2021.07.20.15.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 15:09:32 -0700 (PDT)
Date: Tue, 20 Jul 2021 22:09:28 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 38/40] KVM: SVM: Provide support for
 SNP_GUEST_REQUEST NAE event
Message-ID: <YPdJmKXhXKOZdlld@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-39-brijesh.singh@amd.com>
 <YPYBmlCuERUIO5+M@google.com>
 <68ea014c-51bc-6ed4-a77e-dd7ce1a09aaf@amd.com>
 <YPb5yfKEyJjvDbOl@google.com>
 <0641fdec-48a0-b3b7-9926-3ce5a6e53eb0@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0641fdec-48a0-b3b7-9926-3ce5a6e53eb0@amd.com>

On Tue, Jul 20, 2021, Brijesh Singh wrote:
> 
> On 7/20/21 11:28 AM, Sean Christopherson wrote:
> > Out of curiosity, why 4 VMPCKs?  It seems completely arbitrary.
> > 
> 
> I believe the thought process was by providing 4 keys it can provide
> flexibility for each VMPL levels to use a different keys (if they wish). The
> firmware does not care about the vmpl level during the guest request
> handling, it just want to know which key is used for encrypting the payload
> so that he can decrypt and provide the  response for it.

Ah, I forgot about VMPLs.  That makes sense.

Thanks!
