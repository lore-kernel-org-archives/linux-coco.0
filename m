Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07EE62A
	for <linux-coco@lists.linux.dev>; Fri,  6 May 2022 00:53:15 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id w1so10145382lfa.4
        for <linux-coco@lists.linux.dev>; Thu, 05 May 2022 17:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C5GPnJUVP3BtQbsY0hrSBcmaxNZOUF97hX/9OQsx+nA=;
        b=nLZPkQ5PVl8ydEQfOubz8On/1Fq63lQN6lh/vZ5Aegg+xPA34KIVO26IrV87jX5wPe
         8M10ylUu9YV8TQM8HP2/8undJLvbVcL1/dVTkVcECHb9CzEEqKq07m14/HgnXxA7Njia
         YFD9HYkWHYF6sWGhtvKCPmH/IStLKZu+wd185XNNJDESn6HYZEa+2g+/xT6nMw6+t8/g
         39BKxahY18nOyAdMZrhMfCYQLCIMFGLV4qB/FupV+3jv+iDHAqrfEb52qkY/VpnQPsI8
         KTvsIBhr+lDuXx6BCqyiYijMMAKSx6DWRCL3X9YV0fdlAgTdw+PmU7XeCeBdqNxsFuvW
         hzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C5GPnJUVP3BtQbsY0hrSBcmaxNZOUF97hX/9OQsx+nA=;
        b=x++IYfEDFT9iqaaa4AnPX1ez3iOB8zGJgvvzdTJX7lyLTGzXbsOQIQzCSiJ6in4syQ
         0CnKPJoyzgf5oe0ZQQBtjed9L/C/c/QDOcFFNPf8kZrq74YyzPzzmBni5iUjEkcjiwCU
         Buls7Q+n2YE4MHB+rhO3wTDdnFSa6Ng84y6K+fAt1ELlAnWfbrmN4HWcB1T1YB3MnVIY
         eeTnUouSJJz34lWbJ7etpm4I3EEc+5ofwlK0nAb77LcmrhFkpNH5y61wtz0MOoJOqoWj
         /hmjajPAah1UY2Q5vENTA3V4iXq3xuirf+zCAFGOfeLmERxUUHn2hslldiwvUnxKzy5z
         MfyQ==
X-Gm-Message-State: AOAM533y7UZ9UzlrTJQpVaTDUhmamGLjDArJhlbTqnslzlMyFP0SnK/G
	RGr9eQnRFQ00G2sF2FWDB9nRSA==
X-Google-Smtp-Source: ABdhPJxBGAyRzcf0ZNYdABhMRx6y2moZzNV7QFboqJg1pD4XhwD22Dkio7DKSmS7KcErp6zO6RaPpQ==
X-Received: by 2002:a05:6512:3b87:b0:473:9e36:5f0d with SMTP id g7-20020a0565123b8700b004739e365f0dmr715960lfv.424.1651798393878;
        Thu, 05 May 2022 17:53:13 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id c33-20020a05651223a100b0047255d21113sm443339lfv.66.2022.05.05.17.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 17:53:13 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id A1C92104AF0; Fri,  6 May 2022 03:54:58 +0300 (+03)
Date: Fri, 6 May 2022 03:54:58 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Hildenbrand <david@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>, x86@kernel.org, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCHv5 02/12] mm: Add support for unaccepted memory
Message-ID: <20220506005458.jrebaho2w55ojwyb@box.shutemov.name>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-3-kirill.shutemov@linux.intel.com>
 <2bb92a84-18f4-d007-9465-fdc19f6f1c86@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bb92a84-18f4-d007-9465-fdc19f6f1c86@redhat.com>

On Tue, May 03, 2022 at 10:21:03PM +0200, David Hildenbrand wrote:
> 
> >  
> > +/*
> > + * Page acceptance can be very slow. Do not call under critical locks.
> > + */
> > +static void accept_page(struct page *page, unsigned int order)
> > +{
> > +	phys_addr_t start = page_to_phys(page);
> > +	int i;
> > +
> > +	accept_memory(start, start + (PAGE_SIZE << order));
> > +
> > +	for (i = 0; i < (1 << order); i++) {
> > +		if (PageUnaccepted(page + i))
> > +			__ClearPageUnaccepted(page + i);
> > +	}
> > +}
> 
> What was the rationale of leaving PageUnaccepted() set on sub-pages when
> merging pages?
> 
> I'd just clear the flag when merging and avoid the loop here. You could
> even assert here that we don't have any PageUnaccepted() on tail pages.

Okay, fair enough. I will change the code.

-- 
 Kirill A. Shutemov
