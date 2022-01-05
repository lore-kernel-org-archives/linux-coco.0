Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF35E2C80
	for <linux-coco@lists.linux.dev>; Wed,  5 Jan 2022 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641413229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8MZFVlpgT6OszG47rgOiJuQIvMn4MT3P/ee6EVCrTU=;
	b=C8yPne0lKKno9XlXrjGzgqAckolYG223cI7dMeH4Jyd0NTvXAqxI8tKP/CC1QPJCOCuu5q
	+n31X2yFZ865rzwIU0eYuhSSACbSnf1/MDBRYPMZf976Q8dPbWIMnon3hKiUjwkzTsB2UN
	oHssCWrrgr78jH/tLi/cHnDYw4eD3Qs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-pUDspjLzOiOuAFtKguO9yQ-1; Wed, 05 Jan 2022 15:07:08 -0500
X-MC-Unique: pUDspjLzOiOuAFtKguO9yQ-1
Received: by mail-wr1-f69.google.com with SMTP id i20-20020adfaad4000000b001a483095eafso116770wrc.3
        for <linux-coco@lists.linux.dev>; Wed, 05 Jan 2022 12:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=A8MZFVlpgT6OszG47rgOiJuQIvMn4MT3P/ee6EVCrTU=;
        b=ukR1KUIJhGd/yvh2Uy8/on+Lt08GzVAoSgtrZ2KmSrdx2j7N9v9nnJFg9fD5cvg+Qq
         YAUIcdLuc/NHVh9XzU64dttfRb5yidKm5xSN1+GvQWNweyfuZwI12j6okuwH6BCSK8mi
         ULzVtrrsRAfatbGYpOHkrBdSU2Tpd3L3yNKRue2qecEaczLn92uKfRxWyGAuTWLXW+vu
         GT5MpooQ2EJOzuf28mEgQ7pMmKSQ2Q1JLvf9RhwcUUKi1cen85oEllBvYl4wf7MhuBCN
         k4hn4aAzu9trdOPanDDE9RgasOFPsXbmf0DvB/Tz+HY46jwlKzKTBP2R4ytTMvTUTJnb
         4OXA==
X-Gm-Message-State: AOAM532AdrpZIbgNuTtmSPzUuwxaaFAslxdg788xyQq4vHJ4oZEYdMAD
	Q6iectrTv+vjRJgt0RhHOKBTe59h4+utN2H8uaE9ohqfxuG4HIOkzq8hfT5v013kJ9uDcIK/25M
	Dkl7xRMqIx9D0aKOnqilDpQ==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr48944211wrq.142.1641413227577;
        Wed, 05 Jan 2022 12:07:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqcXy8RbxWDVk9mGaKfR5t7S8HKm+nBYmYenSuqXrW0ScmqqVktMDY51dAqnBoNGakZFJBDQ==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr48944197wrq.142.1641413227386;
        Wed, 05 Jan 2022 12:07:07 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id o3sm3388849wmr.15.2022.01.05.12.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 12:07:06 -0800 (PST)
Date: Wed, 5 Jan 2022 20:07:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Borislav Petkov <bp@suse.de>
Cc: Dov Murik <dovmurik@linux.ibm.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, linux-efi@vger.kernel.org,
	Ashish Kalra <ashish.kalra@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andi Kleen <ak@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Andrew Scull <ascull@google.com>,
	Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
	Jim Cadden <jcadden@ibm.com>,
	Daniele Buono <dbuono@linux.vnet.ibm.com>,
	linux-coco@lists.linux.dev, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <YdX6aAwy0txT9Dk7@work-vm>
References: <20211129114251.3741721-1-dovmurik@linux.ibm.com>
 <YdNHgtuVoLofL4cW@zn.tnic>
 <0280e20e-8459-dd35-0b7d-8dbc1e4a274a@linux.ibm.com>
 <YdSRWmqdNY7jRcer@zn.tnic>
 <YdWEXRt7Ixm6/+Dq@work-vm>
 <YdXq9t75aYLJfb69@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YdXq9t75aYLJfb69@zn.tnic>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Borislav Petkov (bp@suse.de) wrote:
> On Wed, Jan 05, 2022 at 11:43:25AM +0000, Dr. David Alan Gilbert wrote:
> > There's more than one type of dance;
> 
> So Brijesh and I talked about this a bit yesterday. There's all kinds of
> dances...
> 
> > this partially varies depending on the system (SEV/TDX etc)
> 
> By "SEV" I guess you mean pre-SNP because SNP attestation is reportedly
> much better.
> 
> TDX I'm being told is not interested in something like that atm. I guess
> they wanna do something different wrt attestation.

I thought I saw something in their patch series where they also had a
secret that got passed down from EFI?  As I remember they had it with an
ioctl and something; but it felt to me if it would be great if it was
shared.

> So what we're talking about here is pre-SNP attestation, AFAICT.
> 
> > and also depends on how you depend to boot your VM (separate kernel
> > or VM disk). Also it's important to note that when the dance happens
> > varies - in SEV and SEV-ES this happens before the guest executes any
> > code. So at the end of the dance, the guest owner hands over that
> > secret - but only then does the geust start booting;
> 
> Right.
> 
> > that secret has to go somewhere to be used by something later. For
> > example, something might pull out that key and use it to decrypt a
> > disk that then has other secrets on it (e.g. your ssh key).
> 
> That is the other example I heard about.
> 
> So, to sum up: this looks like part of a pre-SNP attestation flow, i.e.,
> for SEV and SEV-ES guests.

Yeh. SNP is a whole different question.

> Follow-up question: is this going to be used by other cloud vendors too?
> Or am I gonna get another implementation of sharing secrets with a guest
> which is just a little bit different but sender #2 can't use this one
> because raisins?
> 
> Because that would not be good.
> 
> So, is this what cloud vendors using SEV/-ES guests would like to use
> and what they all agree upon?

I'd love to hear from those other cloud vendors; I've not been able to
find any detail on how their SEV(-ES) systems actually work.

However, this aims to be just a comms mechanism to pass that secret;
so it's pretty low down in the stack and is there for them to use -
hopefully it's general enough.
(An interesting question is what exactly gets passed in this key and
what it means).

All the contentious stuff I've seen seems to be further up the stack - like
who does the attestation and where they get the secrets and how they
know what a valid measurement looks like.

Dave

> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG Nürnberg
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

