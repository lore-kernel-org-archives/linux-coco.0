Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE2809
	for <linux-coco@lists.linux.dev>; Mon, 24 Oct 2022 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666609197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI+MGmQeZcLX8dW5DHehCj6Q4kpDcOtjtIBiJRfTiZ8=;
	b=UmNycnHTEYXzqhNsYw99Cl+9+56S80w/koB8UkjJj4U4k6kx9LFgVJgXbyaPCtarfhxYwl
	fUt6JTPveJwYQRqoR40IPUScS9vVEAPA84mcELByJy3RJi1QqqxhewtdLgwgD37TeK7Fuv
	YanlFtd1aRuNlxNvsdKdg+HFCuYCNsQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-17eucdc4PRSkQRS6olPMGg-1; Mon, 24 Oct 2022 06:59:53 -0400
X-MC-Unique: 17eucdc4PRSkQRS6olPMGg-1
Received: by mail-wr1-f69.google.com with SMTP id d23-20020adfa417000000b002364a31b7c9so3247257wra.15
        for <linux-coco@lists.linux.dev>; Mon, 24 Oct 2022 03:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pI+MGmQeZcLX8dW5DHehCj6Q4kpDcOtjtIBiJRfTiZ8=;
        b=cUZjvUkM8PQWVKxTPTBhcWfdXA8Rezwbvpt0+Tu2vap+idUMlnwe5U/yokwzUmRtaY
         ATsuaLCSvsVY5iYCJH/0btMGkQwDIfmfT9iwcWqAS/OqqBOTfBcoapIAGBBjXbWHwW3c
         OGvkk+lQ7y1MPyPNlZA+GfEwCHcSLnpzS9xEFv0kHZTrmI/qZ+KG44V3AxcPA5l/Hc61
         MOCeuAdj63StiklYlpdv+gBXChwJAWoi+qEbGzTkdDGzO13fLsaQgr8pyqvQ8E+QniVQ
         LmtOeUicfKG5bpAFj51PkRxmVgfvDh5x/i9NyKqwP/BLhskNYPqMQ4GzgB014TwOQ+YH
         FyJg==
X-Gm-Message-State: ACrzQf1YGq8P/t2oqwLaVt3CSIKECu9UceoTmQ9sqfbJu4KDmOKto3Sl
	p57veURTq9g4ucEuhUeP2EnPFIfEoPdY59ye8bNWYykwTyJByqy8Om0UfbIiL4+dA66oSAWnKk/
	6GPakfLC6LfTZ7rhTQtq5tQ==
X-Received: by 2002:a5d:598d:0:b0:231:2304:3a5a with SMTP id n13-20020a5d598d000000b0023123043a5amr21326974wri.434.1666609192755;
        Mon, 24 Oct 2022 03:59:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/f+JymJEKkz9kxav3+AsbVA+22HK10FrTYikYBquJG3hTGB1VDJu97wFeyo5NFP/II2XFhA==
X-Received: by 2002:a5d:598d:0:b0:231:2304:3a5a with SMTP id n13-20020a5d598d000000b0023123043a5amr21326956wri.434.1666609192501;
        Mon, 24 Oct 2022 03:59:52 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id s9-20020adfdb09000000b0022cc6b8df5esm12689421wri.7.2022.10.24.03.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 03:59:52 -0700 (PDT)
Date: Mon, 24 Oct 2022 11:59:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jon Lange <jlange@microsoft.com>
Cc: "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	David Altobelli <David.Altobelli@microsoft.com>,
	Steve Rutherford <srutherford@google.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Christophe de Dinechin <cdupontd@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: [EXTERNAL] RE: SVSM vTPM specification
Message-ID: <Y1ZwJvNvky6Wst7k@work-vm>
References: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
 <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
 <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Jon Lange (jlange@microsoft.com) wrote:
> The drawback to having an identifier-prefixed document is that it necessarily restricts each report to providing only a single statement from a single SVSM protocol.  If, in the future, we find it is common for a relying party to require, say, five different protocol statements, this imposes a requirement to obtain five separate reports.  This means a minimum of five round trips from the SVSM to the PSP, which seems undesirable.  I think we will really want to invest in defining an extensible format that can be placed into a single report.  I'm not claiming that JSON is the only option here, but I think we will regret any format that prevents extension within a single report.

Having something structured does seem to me better than tacking a magic
byte on.
(Although as I remember, the SNP report already contains a flag saying
which VMPL level the request was generated from; whether that's enough
to discriminate between guest requests, and requests by the firmware
I don't know).

> I'm having a hard time understanding any scenario that involves an entity that has access both to an SNP report and the vTPM and which also needs to verify the report.  If the objective is for the guest (which has access to the vTPM) to obtain the TPM's endorsement key, then it could obtain it directly via the vTPM protocol without requiring the SNP report.  After all, the vTPM SVSM protocol does not need to be limited to providing exactly the functionality of the vTPM command set, but can also include other utilities that are useful to the guest.  If the objective is for an external party to obtain information about the vTPM, then it doesn't have access to the vTPM anyway and will have to rely solely on what's in the report. 

> If the vTPM endorsement key is rooted to a well-known certificate,
> then the TPM certificate can be provided directly by the guest without relying on any SNP report (in exactly the same way that physical TPMs do not rely on a separate hardware root of trust to authenticate them).  Can you shed some light on scenarios in which you think the guest has no choice but to compare the SNP report and the vTPM state to verify that they match?

I think that depends on the lifetime of the keys, and who manages them.
If you're in a cloud environment where something apparently trusted is
managing the state of your vTPMs, you might be able to do what you say;
but then you still need a mechanism somewhere to get the SNP state
to the trusted entity that then provides your vTPM state before anything
in the guest uses the vTPM stored state.

I think the argument is that if you used an ephemeral set of vTPM state,
then at any time after boot you could provide a combined vTPM+SNP
attestation report to a third party who would do the normal TPM
validation and then do the SNP validation.  That avoids the need for
magically loading state from some trusted entity in the firmware.

Dave

> 
> -Jon
> 
> -----Original Message-----
> From: James Bottomley <jejb@linux.ibm.com> 
> Sent: Friday, October 21, 2022 6:04 AM
> To: Jon Lange <jlange@microsoft.com>; David Altobelli <David.Altobelli@microsoft.com>; Steve Rutherford <srutherford@google.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>; Christophe de Dinechin <cdupontd@redhat.com>; linux-coco@lists.linux.dev; amd-sev-snp@lists.suse.com
> Subject: [EXTERNAL] RE: SVSM vTPM specification
> 
> On Fri, 2022-10-21 at 00:02 +0000, Jon Lange wrote:
> > Surely the primary value of a document hash is to prove its 
> > authenticity, not to determine whether two documents reflect identical 
> > information.  I understand your concern that two "canonical" 
> > representations of the same data may result in different JSON 
> > encodings and therefore produce different hashes, but as long as each 
> > document can be authenticated by its hash, does it really matter if 
> > the hashes of the two documents are different?
> 
> If you only have an AMD-SNP attestation report and access to the vTPM, you have to query the TPM properties then construct and hash the document yourself to verify the report.  I sometimes think half the history of security protocol implementation consists of one engineer struggling to reproduce the hash created and signed by another, which is why I have a preference for it being exactly specified and simple.
> 
> > There is a ton of discussion here about vTPM because it's an important 
> > problem, and it is valuable to recognize that a vTPM implementation 
> > will likely require some sort of SVSM-issued document to describe that 
> > vTPM.  There's no reason to back away from defining the structure of 
> > such an SVSM-issued document.  But we should also expect that in the 
> > next 2-3 years, we're going to invent other valuable functionality 
> > that an SVSM can implement that will also require the SVSM to issue 
> > some sort of authenticated statement.  If we marry the SVSM report 
> > information to a vTPM, then it's going to be really hard to add that 
> > new functionality, and if we don't anticipate the need for 
> > extensibility, then we're going to wind up in a future where an SVSM 
> > will issue different kinds of authenticated information (vTPM on one 
> > hand and new feature on the other) and the relying party won't be able 
> > to know which is which.  I don't see how we can avoid the problem of 
> > defining an extensible document schema now that we can extend in the 
> > future as the role of the SVSM expands.  JSON is an extremely 
> > attractive syntax for such a schema - certainly much more so than XML, 
> > and also likely to fare much better than any binary standard.
> 
> Allowing the relying party to know what type of authentication was why I proposed a type prefix to the guest data in the report.  The reason I like the type in the guest data and not the hash is so the bare report is self identifying even if it costs us a byte or two of the nonce.
> 
> There are 2^32-1 possible SVSM protocols, so nothing in the above precludes adding a json based hash call if a need arises (or indeed many other binary/json/xml ones if that's what people prefer).
> 
> James
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

