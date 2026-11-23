Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446691;
	b=ApUwy27Q28BNBgfmTuu5vnAPf1zXc+3m/j01H4V8nZdiZGUQcByIGsejvJinrtkzttTt
	 vReoj3FvH93qIxx25Ejksoz0GIucqMZM/psm6Tr/VV9lGPAsVPlnqudcesv93iM3Q6HAI
	 uv56wk1HNiYnYVtInyZLtHPYeXR0R4fqCIOXeTvElKfiDLPFAtjKZptcsx3uK7PQfogFa
	 ufpv/AZWK0Je+1A2KBSDqjNWZLtDPJdadkdGyb1eAMGzAZqDIMl81MvKAAZQvY9vH0kKg
	 Awb2wFNRFpl40SBxHXxM0Yz4NyNHOdYDov81ndNRgKbS8hOfuVYhIPxpsdG8INp62Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
	b=QHogsoNMYcfyeqlj4AnTtRPOovwIIjHKfdLNL4ZB0VALOtBRGf/3hososzOkUVlogU/N
	 kOIcnHZZwo8zC0IjIGYAMMCL5rYz39dZQBPwo4yTXb4RHgrOeFciMF//ksaBQq0QIwffo
	 VNYXRkyC+nGrT/9vE78Cvr2IiK2ETRjJiYJbwTdnLTbhjjo6t0whrT1+IdHFoC0GEH0tk
	 X9KsUzPGd5fNTlNFNpkH6n4mmsTWSt4jzY/FAwCQU4VKvnfLKAGn2nEgDZQkzmFLBIn3T
	 BePFduYB17zV/MimQzKLxVUs8By4y3FtLipKHTLet5I1EKojE+Q0SRtkumrngRHYKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DnqfNEc1;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415E606A33F
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 15:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C415E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DnqfNEc1
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-92123971d1bso28366786d6.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795446690; x=1796051490; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
        b=DnqfNEc1qOm+Ki93dtk5wkOMaNKoNCX9Rfc9pwY3z2LpU2kXQp17n5+/QXexCLT4vp
         7rQwUrdp+8i30Zm56aZM32kQLx2073tOyziXdQa1kNAJ4BpBjOtT1ystfUd9I/stdOb/
         JlM7eCtyut7NwAwtdWoj24FhZ7V4Bnph+TvaHe27nHcxKwvN6JP95plbB0+Yx705mgOw
         JHQJnFmmIlq+BjArexl34EMijneJHmKO4kJJMWiaAE87WpLKua1UwrO/g2fg4fO80MTt
         4IBzCX5iHZkuwq6UY4qdnKI9aUHLvTxJgH9NFdqdMgKRmiQtaEI9W2b6zwoC1Ves9G3p
         ubyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446690; x=1796051490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
        b=bpGujnqauwmhG4U6J3RQbOlYVZqAVPNJX7E47LD/liCpeUcjxqTx/oMHuiD0dxOvdA
         A1Jqaya3cxmReToHdJbWkdGGn7zF0mtUmXti4Nl9Q9xEijVMXsyYFBo9bgvVvmDd81Bb
         3QScQJHDVOUokP0/7NINx7x4VmgSAunqK1k1XQwE9hdcvCga3TnolkLFZORhmjbRW/WU
         71nEjEWWwCzp57qeSAxaw2NZVmQWg6Xe0bLRXm8258HKIdC/S+++mD75S879MMovZAFs
         SDg+2Kbb9oGqnbOrBKQ+5fg/yqpB1BzqGaNw9xf93Ia4AveJQ40WK6q3urrT63zcQhSO
         BdkQ==
X-Forwarded-Encrypted: i=1; AL+hErHcrBN8HBvIaTWadSraSPFr9LmPVYTuqnX9GJ9Do15XsNRxzqD5tjF2h86K47jcsvhWbGx6Jc+LHvkl@lists.linux.dev
X-Gm-Message-State: APuU4Z8rnr9PiuljO4hGNdHwTB2GHEavzqeS75WQuchz89yA9Mt9W17P
	0AfaYH/ytWx7itoAy4dymyrcuZTTVfMnShIp/Z9l24tnMR1z42uDzcUcB8QB/3NKGtE=
X-Gm-Gg: AZFdTZeXew5Hj6/uShuwpl3LPQXRa9CgDnENlcwSjSYm5S2KUgeuCUq0ip9ohb39vvA
	ilT1XVUHOs/bJkTdZwwG+HR1ciGnAcEhJkYd4kIa59OC71gCRq5ltNGGhhLX7rpJ0VjAuF2yrRi
	y/+R41tC12AiKB/1s7Ozpng048TjyWSRLpF2bTcK/gP94M+yqqLFzKlh9/PmJFf/gQ83QoR/t+k
	cz+vTTGem0O7Kg883jAdUQw5ptlCW9LVpikdQDXHpYzgHR2x4CXIc9rDTO3Wpn5KvgGpFJQrNq2
	xDntTHCbGc+6M5nl3c/fiAsB0Z8F1GUrI0LXcQpiA3sttrWlthuLn369xgH/8Ipl8nUckFP19j5
	Nzg2TORs3k+rVmZ+7FZH68NBAcl9uNxmYyGw6nlPoaIvYmbBtgiX8n7LbYT+gudCXouSYJhNcx3
	5kKfpmjzeT42DtyN8Ktr0lLXl3o8fjyhHXEefmQgRfSzgdIv82BCHre0C6EWibAzsH7AskAiaY+
	X1CR9qYuydRhABuRhhU+vxoB1rqZXqBMMpcyI7sFdzMNxRSHgRycp0ns3I9yl2n4aOMml7jq3IF
	xVYLffdP+hIm3FzADaYt0DaoXXYGWH7JgfKeQ9HyDKmselYtaBYmNUzfRZgric5L5jIF+AC2DN0
	uU2k=
X-Received: by 2002:a05:6214:4108:b0:921:266f:50ff with SMTP id 6a1803df08f44-92134b3f207mr208575596d6.52.1795446689538;
        Mon, 23 Nov 2026 07:11:29 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b50besm106533186d6.9.2026.11.23.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:11:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVhY-00000000ro7-1hOk;
	Mon, 23 Nov 2026 11:11:28 -0400
Date: Mon, 23 Nov 2026 11:11:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@resnulli.us>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	zohar@linux.ibm.com, aneesh.kumar@kernel.org, dave.jiang@intel.com,
	nik.borisov@suse.com, sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <20261123151128.GD179082@ziepe.ca>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awQz1P6iXYrL8lv0@kernel.org>

On Mon, Nov 23, 2026 at 02:38:44PM +0200, Jarkko Sakkinen wrote:
> On Mon, Nov 23, 2026 at 09:09:02AM +0000, Yeoreum Yun wrote:
> > Hi Jiri,
> > 
> > [...]
> > 
> > > +static void __iomem *tdx_attestation_log_map(size_t *length)
> > > +{
> > > +	struct acpi_table_header *header;
> > > +	struct acpi_table_ccel *ccel;
> > > +	void __iomem *log = NULL;
> > > +
> > > +	if (ACPI_FAILURE(acpi_get_table(ACPI_SIG_CCEL, 0, &header)))
> > > +		return NULL;
> > > +	ccel = container_of(header, struct acpi_table_ccel, header);
> > > +	if (header->length >= sizeof(*ccel) && ccel->log_area_start_address &&
> > > +	    ccel->log_area_minimum_length &&
> > > +	    ccel->log_area_minimum_length <= UINT_MAX)
> > > +		log = acpi_os_map_iomem(ccel->log_area_start_address,
> > > +					ccel->log_area_minimum_length);
> > > +	if (log)
> > > +		*length = ccel->log_area_minimum_length;
> > > +	acpi_put_table(header);
> > > +	return log;
> > > +}
> > > +
> > 
> > I think we don't need to dump log area with the log_area_minimum_length
> > since the area would include none-event otherwise, pre-exist tool (i.e.
> > tpm2_eventlog) reports error for them like:
> > 
> >   ...
> >   - EventNum: 21
> >     PCRIndex: 2
> >     EventType: EV_EFI_ACTION
> >     DigestCount: 1
> >     Digests:
> >     - AlgorithmId: sha256
> >       Digest: "b54f7542cbd872a81a9d9dea839b2b8d747c7ebd5ea6615c40f42f44a6dbeba0"
> >     EventSize: 40
> >     Event: |-
> >       Exit Boot Services Returned with Success
> >   ERROR: corrupted log, insufficient size for event header: 3
> >   ERROR: failed to parse tpm2 eventlog
> >   ERROR: Unable to run tpm2_eventlog
> > 
> > 
> > So, what about export *real size* of eventlog like
> > tpm2_calc_event_log_size()?
> 
> Nothing in the patch (neither commit message nor any comment in code)
> says that TDX attestion registers share the same format as TPM2 even
> log.

It comes from the UEFI spec's definition of CCEL:

 38.1 Virtual Platform CC Event Log

 If a virtual firmware with confidential computing (CC) capability
 supports measurement and an event is created, virtual firmware should
 report the event log with the same data structure in TCG Platform
 Firmware Profile (PFP) specification with
 EFI_TCG2_EVENT_LOG_FORMAT_TCG_2 format. The index created by the
 virtual firmware in the event log should be the index for the
 confidential computing (CC) measurement register. It is CC vendor
 specific.

It makes sense that the kernel would size it correctly.

> As per the function, perhaps tpm2_calc_event_log_size() should be
> relocated to lib and have non-TPM name like firmware_event_log_size()
> or something.

Probably under drivers/attestation since that is where all the TCG
formatted logs should end up. It should be 'tcg_event_log_size()' or
something. Maybe a tiny module for it like we would have done in lib/

Jason
