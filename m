Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005121CA04
	for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459801; cv=none; b=nHjTmQhwb8sPUwXDKzyfIi+N8UPgRUtU3fk4qALCDecWcDwnlNdibk+VvsHA7WW3jb5NJRxjDe3MMek/PQnuTB9Tfy7w4C9jhdi4dtv/koiKjLbiGicNOhIsyxDNaWwz6NHx2gQMvrYDG9ssq1fd+YfEuDPHtxWocJ4S4qMH88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459801; c=relaxed/simple;
	bh=4PgTmaMk5ogvFcIREugLBrsHV37djLsMSD7buWsbe98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdiOqQQ0ih4MA71g93xU56ErLOQCIUlXUJZkLPjWTNzFtAzeJ5kVuNE4a/DeIvfS8+7W/YWGMNrhoWhQrZ2XmGfoi74JQxtMzdC7m9W3P/icFROCU6XinB8Y6nTNZyesxXm25nTDXzzDGt9T7QpyDsoxNL5d3Z1qdv9nnIzJ/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hStehXwj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hStehXwj"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so7411191a12.3
        for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 15:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743459798; x=1744064598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PgTmaMk5ogvFcIREugLBrsHV37djLsMSD7buWsbe98=;
        b=hStehXwjhU3F7poMHh4xL6xBreYJb8GlPXdGdmnMai7cLlPGWango16PoJWq15fwoz
         Fl0cktFf1GOd/buAowEZZanwIo90YU29kW3QEmih5T+lxDjh9gYljKsnR9WEbys15ub6
         0884+oM+UVzXI0nGxS/lnRSJVyQd2v2qJDQ8pME+wbRjRqe2g7Iild87Vm6StID/wqUS
         zmiEvAAnFryZtmLoBsjGy5LJ9kOkuMwbT+uPq4MxijJEiZA/4sbqkndB9WD0JqWobLu3
         +EE8NEZLK229P9y0GD2doLNu9rkbh0QMnQnU/sniEzS/FMbTrTwMhV24OjiRoPdrIHGR
         D1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743459798; x=1744064598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PgTmaMk5ogvFcIREugLBrsHV37djLsMSD7buWsbe98=;
        b=SwiDDcTncO5xB4t6MewxK0kpy0Ov8jqgB2FHKThEWnJ7L9YDSztrZt1Cn3txWPM0ph
         HV/KXgnMTA1GHWq5W6ZnSe5pRX8pn+3ElYoe1JOLZrcs+5h6tvU0APVQ4FB8DXT8IaFq
         wr04+JcRzi2PX6JJ60Nf1Wb0w8QlxWN3f7Kmx3uI5mYrvjib73O5hWmRrQC9ojujSsX3
         1rXZYKrk6XZQ1a6gn3vmGeHNGAPw+UppVdWlM1CZh5RTTatehap9K1ThUwL0IAomJvUe
         ohvw7wCXzo1WoQ70dQHZrggjgm2xAmcLgeiyBZ6ktcPKWCC7o/kojmKsKW5qb3Sml0bb
         mB/w==
X-Forwarded-Encrypted: i=1; AJvYcCUjkbkF/k3rY8PFFZ8OAt3GBRl+JHbr/ZuY2QlzCqeg4XXQngW513ATocwDUyiB/hYZT9tjnK28ingI@lists.linux.dev
X-Gm-Message-State: AOJu0YyBKmHsSrpaGtIdj/6xZGfv4JDxrNQZcecYwMFXyT7peLEQrjCh
	4q3Lvi4uq0vA1IQWRybHXEb78A3WKR6X4Em1j0eYeSkeG3ZqVNZRPfRV/crpT31n92c8YiG3Zfh
	wwQ6bf6XLbZxNpHCy0PSWuO9n1mG2Nce+t7Fv
X-Gm-Gg: ASbGncvsQWltYxhKU+X3yY0ESEAixQhyQKpihp16qyfpaBC6Jmb7ZgTO3AzSMt5SV1w
	NsHqzCiKti1iM9GJNDd5owXc6A6qUBFbq7RQ3TXa/l/PNfij8Y1Ooo+TZ7D2wA4Cs/z9VGsobFB
	ktP8E6OzpyHhkqFX1lmaTFkH7iIV0Oyeb/RHk=
X-Google-Smtp-Source: AGHT+IFHMx1yE7gHW582wXMuvOh7tHgTZivr88kXV0aPgVkLgrM9yfWRJOM2hQFiPDsaHWm4esXlGziN0BjlWvQIYQc=
X-Received: by 2002:a17:907:2cc6:b0:ac3:9587:f2a1 with SMTP id
 a640c23a62f3a-ac7389d8dfemr885055566b.20.1743459797781; Mon, 31 Mar 2025
 15:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250331103900.92701-1-sgarzare@redhat.com> <20250331103900.92701-4-sgarzare@redhat.com>
 <Z-rSMi2uCvShLbLS@kernel.org> <CAAH4kHY-Orjr_+rcYNemuWrAOOtyrCMD5s6KsOrkX740AARXiA@mail.gmail.com>
 <02190762dd82104070ff1a2942a7be703f4ff53d.camel@HansenPartnership.com>
In-Reply-To: <02190762dd82104070ff1a2942a7be703f4ff53d.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 31 Mar 2025 15:23:05 -0700
X-Gm-Features: AQ5f1JqX-yW5Je-QNs6buiWjeJcb2hXA7Vjgj8fcMn8wzx6HtqYBhlJtZrCDaIw
Message-ID: <CAAH4kHYwDgnYsMhJ8zZWn1uU4tqqnSXOLKEJNMb-3OCNrM7Z9A@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] tpm: add SNP SVSM vTPM driver
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, 
	Peter Huewe <peterhuewe@gmx.de>, Ingo Molnar <mingo@redhat.com>, linux-coco@lists.linux.dev, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <jroedel@suse.de>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 2:26=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2025-03-31 at 13:56 -0700, Dionna Amalie Glaze wrote:
> [...]
> > I might be unclear on how I should be testing this, but I do see
> > /dev/tpm0 and /dev/tpmrm0 when I build with CONFIG_TCG_SVSM=3Dy, but I
> > don't see the event log in securityfs. What am I missing?
>
> The vtpm driver for EDK2/OVMF I suspect ... without that the UEFI won't
> lay down and event log for the kernel to pick up.

This test is with Oliver's PR https://github.com/tianocore/edk2/pull/6527

>
> Regards,
>
> James
>
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
