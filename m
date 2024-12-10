Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3F23DE87
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843058; cv=none; b=bcyNXWBiHuJDwZnJ3R5EW17MNKw7Pf0zpNwE4QaCRy/sSnSZo2uWDuHH/OpcMn+EFE5FE4Mk2AcwEMNf1lxfuC31PvNTxcZYbKROT6++N0kIWd567rI8EzQ1I+kmZInVlSKPuARYQKxDBTlbdMm/K9Gejw4T8Z0jeD4+zvpUCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843058; c=relaxed/simple;
	bh=ukjdHQgppfhZ4ld3b0epSQ6+Sp58DgXjMSZP+XOlx+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQbDPHDazEJcPSJv2+uDiZ2CPVT5FtD4dHYb/2TI7ox9S4DaOm333RkFD+xlGb9KOmPLbhLPZct/t2RqvuJ8DcVoyG/gBX8E+8NmTYjDLsy+lIaEB/hv6CG6w5VahASzEAOnVlOWgGn3eETc7D1tmTuy7CpClat7Acdo05oMlt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Rb4ffKWG; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Rb4ffKWG"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d8ece4937fso31449246d6.2
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 07:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1733843055; x=1734447855; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aul+w/AZ/V/tfWxFGZGkmQ2XjrfsU0kM7YK/J2vpZW0=;
        b=Rb4ffKWGPcxPG8OARNJikqu10GbKleastqr2+DGD1YtOcvt8rFg4QmJR25G8sFDkWf
         UT2Ff50S1yXRSmtvhUPo51P9PkMQXO3WDHWkEAlUNjNSVlQj8sOGtfk/V63wf8LjXmLl
         Kr7ZrwJvTOahqkCuihEnBQLMtSQ5QQ9Atx+50741+4Aepjm9diJn0tQsk5jVuSK3NO20
         Muhwpl/IwaSyUAxnpN9QcLBjjAOYCkz62Z35kceavdlJvV+q9uAb3k8JKaFYtdyxYz/X
         vNqC1P4uuKgm1aasUxP4PfM86jOdoq1Tv8oP9kyMOHk4bGUEO3RS9Owf22/4z2K507ut
         QdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843055; x=1734447855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aul+w/AZ/V/tfWxFGZGkmQ2XjrfsU0kM7YK/J2vpZW0=;
        b=DZ7sI4P8OMo4q2LP/w6K78K5pG8C7g5cEr7ujQZFi15inun64V4pTgZPVCl7VeZMnO
         IhnKyawGa+egNrb28sCp9ghr7z5SA9JFsCqqVGebm0bj3ilEatgsPBc9G63Qnd9UXH21
         wYGeJXTH/pliUxGOw01MY/d5s7RYgSZVi1P+uShT+plnqL8Msi/1lb7iBcpoH3ntVjK3
         xEYfcxTfYTUECsA6UEwFI/NVB8o9xYtTD/AGalPPQzeNSCE2VMNgWm4gz7+UcWBFgrcv
         M7aTZpnz3FD8fQ+c3KR0HZCf4B+lEkJwxYVlRoPdElwKmi9Jz+5TaBfbeALeGOaT5QVQ
         uVmA==
X-Forwarded-Encrypted: i=1; AJvYcCUuRICPlFZ14Mve5y365gXIfAcPh/XPeNm51+d7ArqvuVF5074W92EJxhx6JAyN6YslXYUT5XkLJ7Ov@lists.linux.dev
X-Gm-Message-State: AOJu0YyT5aH/cJqJ2JWjPaGmrbP9h8mA5nzkEANGMYDI5vVPZt0k+wAC
	+wqaoCoh6zoW03ybNktYsslzIwXV2xqujneZtq9s3WQb5K7dNZUhj9pj1eLckOc=
X-Gm-Gg: ASbGncugDDys/PpasrAkmagk9wwH/PnHfe7tdk/G7TcnBQ9LU77Oe+eGS0qQSNOSKJu
	974xtjlbmmgMNiW6rtHJh+687CpWK6qA56SsT9x0zH7gIvEoBuylXoV3rWGNMhdcq1vqIr6bt8l
	lYriXPGF4YCpTGCNSWGwmeW1GUNoBgiNKwHkEarB/WnCNYjkvlFUN/P0EpabBmTS6+s5MyXt9Fl
	MU1Eswrpwhkuo2ESD5/k2R2kkJ4sZuw6Rb/o6EinWo3rzfuXnG8jZdenr5pudPW8hK3RNPYb8dz
	bABxdHZZJy8UTlAPYQuDdQGl7jk=
X-Google-Smtp-Source: AGHT+IHyRvfTyyUB15vN1Ysf2M16N9KtPiDgvd0O/VN/SYXUfdWudj3J8B/1cFjnew5pjbR5udBkrw==
X-Received: by 2002:a05:6214:400b:b0:6d8:95c9:af2b with SMTP id 6a1803df08f44-6d8e71e8818mr304958446d6.35.1733843055170;
        Tue, 10 Dec 2024 07:04:15 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da66efd7sm60633426d6.17.2024.12.10.07.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:04:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tL1mX-0000000A2oq-1oZj;
	Tue, 10 Dec 2024 11:04:13 -0400
Date: Tue, 10 Dec 2024 11:04:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, linux-coco@lists.linux.dev,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-integrity@vger.kernel.org, x86@kernel.org,
	Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <20241210150413.GI1888283@ziepe.ca>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca>
 <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>

On Tue, Dec 10, 2024 at 09:55:41AM -0500, James Bottomley wrote:
> On Tue, 2024-12-10 at 10:40 -0400, Jason Gunthorpe wrote:
> > On Tue, Dec 10, 2024 at 03:34:23PM +0100, Stefano Garzarella wrote:
> > 
> > > +               if (platform_device_add_data(&tpm_device, &pops,
> > > sizeof(pops)))
> > > +                       return -ENODEV;
> > > +               if (platform_device_register(&tpm_device))
> > > +                       return -ENODEV;
> > 
> > This seems like an old fashioned way to instantiate a device. Why do
> > this? Just put the TPM driver here and forget about pops? Simple tpm
> > drivers are not very complex.
> 
> This driver may be for the AMD SEV SVSM vTPM module, but there are
> other platforms where there's an internal vTPM which might be contacted
> via a platform specific enlightenment (Intel SNP and Microsoft
> OpenHCL). 

Sure, that's what TPM drivers are for, give those platforms TPM drivers
too.

Why put a mini driver hidden under an already mini driver?

> This separation of the platform device from the contact
> mechanism is designed to eliminate the duplication of having a platform
> device within each implementation and to make any bugs in the mssim
> protocol centrally fixable (every vTPM currently speaks this).

That makes sense, but that isn't really what I see in this series?

Patch one just has tpm_class_ops send() invoke pops sendrcv() after
re-arranging the arguments?

It looks to me like there would be mert in adding a new op to
tpm_class_ops for the send/recv type operating mode and have the core
code manage the buffer singleton (is a global static even *correct*??)

After that, there is no meaningful shared code here, and maybe the
TPM_CHIP_FLAG_IRQ hack can be avoided too.

Simply call tpm_chip_alloc/register from the sev code directly and
provide an op that does the send/recv. Let the tpm core code deal with
everything else. It is much cleaner than platform devices and driver
data..

Jason
