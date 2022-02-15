Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27601561
	for <linux-coco@lists.linux.dev>; Tue, 15 Feb 2022 13:14:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id o2so36821133lfd.1
        for <linux-coco@lists.linux.dev>; Tue, 15 Feb 2022 05:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6lHSX3nDfvtiD3huNGIKRJsACSoavhTr9PgfPRk1Big=;
        b=ESudXjEoiYV67csMAz6wN1JL4hXkVwKkPOqRxXMFLxHapy+iAL6CtnAp5lJJKxftcc
         tnEuFlvih63DPCMc5rMm8JaRH/xZVy8acSSvr+UGE3IQQ501svmUL3McYgPNYlDWiNzG
         Tse3SmlGCSTcKPHd+PJNQYjoaLFm5XQEVVsiF5Nx2nsQqfOb8TS6CXG0S8KgWk0xkWmH
         57y06dxQr31Od00TkqWsoE4vI7VaGSxiPmcouTy4BngG8hVxMt/dX4O7p0jhEkuEzuA8
         WcRXRASzCPoJrQT99cPLKxNEsyWIcmdY70urf97+R+oah5HuBBpGYFe3aLxkP6kzdziV
         D9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6lHSX3nDfvtiD3huNGIKRJsACSoavhTr9PgfPRk1Big=;
        b=zDrcka9RGsP233VgWn3YGQh0H5TMgrD98t3/Qy6H0Ee0JCJlo8LvdlFKRS+1oAuQpM
         eJVLc2pSSa9NH/Kvnef9LFgOQ+D+nYiMrgcMldfofMfoc9pb7xN5TfLcB7+i4B6ACOdq
         xydsD0mp5zUdfag7Zxe1ENMF1pgz/kvPngVKUDFNNmDEWlsC4Kqzq6F+7DmcF0zXDV63
         q8Kk4PGra4rYpJ9WlaJ/JrOgW4FlKiV1Ts//bVtZX3HKDyEgmDIythFc9WEUe9I6MB6b
         tNmdPcqD+Ofv4XGCw5I7FZr9fN5UHhW5kCBFesKWLuW4F20Ha5e4Np28IxVo/qyiyzhe
         Nsdg==
X-Gm-Message-State: AOAM532Cssh2D8Rel/v6Hz0JLqq7zp3gbo58ZU3O1dFyfkuwGw9FfCZf
	OhxXTCR3EEAMjM9EWTY60X9OWA==
X-Google-Smtp-Source: ABdhPJwpX7fwVZjUgY2Y9Z1gaYIpMXSKBhynYSWG9vsJYiEN+wWS3V2I3ZjIJAY26pVz/jAP6abjnA==
X-Received: by 2002:a05:6512:6c7:: with SMTP id u7mr3265230lff.128.1644930869890;
        Tue, 15 Feb 2022 05:14:29 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id y9sm4517142lfg.219.2022.02.15.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 05:14:29 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
	id DEEEF103F44; Tue, 15 Feb 2022 16:15:22 +0300 (+03)
Date: Tue, 15 Feb 2022 16:15:22 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Cc: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, Andi Kleen <ak@linux.intel.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	brijesh.ksingh@gmail.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v10 21/45] x86/mm: Add support to validate memory when
 changing C-bit
Message-ID: <20220215131522.l3xytgmy4ufrgnlb@box.shutemov.name>
References: <20220209181039.1262882-1-brijesh.singh@amd.com>
 <20220209181039.1262882-22-brijesh.singh@amd.com>
 <YgZ427v95xcdOKSC@zn.tnic>
 <0242e383-5406-7504-ff3d-cf2e8dfaf8a3@amd.com>
 <Ygj2Wx6jtNEEmbh9@zn.tnic>
 <20220215124331.i4vgww733fv5owrx@box.shutemov.name>
 <YguimA5Au4t2A4oj@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YguimA5Au4t2A4oj@zn.tnic>

On Tue, Feb 15, 2022 at 01:54:48PM +0100, Borislav Petkov wrote:
> On Tue, Feb 15, 2022 at 03:43:31PM +0300, Kirill A. Shutemov wrote:
> > I don't think it works. TDX and SME/SEV has opposite polarity of the mask.
> > SME/SEV has to clear the mask to share the page. TDX has to set it.
> > 
> > Making a single global mask only increases confusion.
> 
> Didn't you read the rest of the thread with Tom's suggestion? I think
> there's a merit in having a cc_vendor or so which explicitly states what
> type of HV the kernel runs on...

I have no problem with cc_vendor idea. It looks good.

Regarding the masks, if we want to have common ground here we can add two
mask: cc_enc_mask and cc_dec_mask. And then

pgprotval_t cc_enc(pgprotval_t protval)
{
	protval |= cc_enc_mask;
	protval &= ~cc_dec_mask;
	return protval;
}

pgprotval_t cc_dec(pgprotval_t protval)
{
	protval |= cc_dec_mask;
	protval &= ~cc_enc_mask;
	return protval;
}

It assumes (cc_enc_mask & cc_dec_mask) == 0.

Any opinions?

-- 
 Kirill A. Shutemov
