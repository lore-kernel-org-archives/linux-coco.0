Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CC4153BEF
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186450; cv=none; b=cL23r7DBG2OBZ52/5yxwzMmkhyet4FVGuW3ro1V6p2G/epdjmTul/4keJ7FGX19la9HlZlBuVc71NT5xHpcAKQ3FmB0hRgQYlGNkcrdA0ozpzml5cedmm+Kuyh2e99rM+lzEqa67/BN4CL4SHaoaJL0qgWT2JXO4LvaR5Woiz58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186450; c=relaxed/simple;
	bh=P49cD1c1ga55CKu/BPb05/frgHbdM2pUd+nEBOmBTDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRl8ZF7iM84R9oeTH7lFt3at3ihWYuOUQUPrYycSF8fJoNeK9fv6afyDV4nJWSKB4sK2v8mdYLgDkcp81fBDqtFkfLyzBX0GTRVYwNnl389xH+kzhVakOknv1LGAQmkBGYjTXIWB9O3NF0XIwStLOyNpa++GBNgUVRzQK8updlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IzYofBSm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IzYofBSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718186447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41hFLxg01Htpnw796WhT3MUnPbtGNzJbrSe/6sJzzZY=;
	b=IzYofBSmuadCK3h7lt/5nTMtNDenVv08M5sXpWPbcb8U7BF1aKoJkvMJUYaoWulKot21gA
	xgmfc+shQkBDl4L26nFPSoxry4A+oTcPZ0fJWVl8CL49en6Oq/d4mvkdu6K6ln+QUT9g43
	/a/t2b56C2b1BGfbSpFnJJyUmCXFCko=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-8e04JmXEMKmcbsnZg0LRwQ-1; Wed, 12 Jun 2024 06:00:45 -0400
X-MC-Unique: 8e04JmXEMKmcbsnZg0LRwQ-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-df771b5e942so10531488276.2
        for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 03:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186445; x=1718791245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41hFLxg01Htpnw796WhT3MUnPbtGNzJbrSe/6sJzzZY=;
        b=mnbe1zUIIHLNyUrCSbLtpPp/aQecqNEdzrHjjqUphP76EiyyLnUeqbfCGXMOppmTvA
         SOAFaEVlvj8mgRr9Ym968OBXgjkw7gdj8QAC4IxEg4XhPlNuwHOfjppJuwcp5NFpjtrv
         ZxUBeWTwGgCgaSGW19wyuUiXnK+liFS3z3du39LDFdxrBbqxrhdRtSqvtWR35jueCFTQ
         aWyKoia/Sa7PqV0paY70J9DrBs1dNbCnETZw8bKpRKaLlQZ9hPjbHw8YjePgRzcslCeu
         txd24Vf+uR/pqWhUMhi5JKb9gTYb1qyt7wpfqUmF0HX1HTBDK2zWdCgvJ98/kcVWU4OD
         qYQQ==
X-Gm-Message-State: AOJu0YxjtgN1Te/NGOosCo/sZQC+DUqsCGrfL/rQWIDmThdYQVzp+nyr
	4EoHJLVNMkGSILZ1arDjWWUtUsxHKqI4SZvCW1znqqu1wdOqbHAiXTzKE64GjR49B1hCrWQ/dJg
	n9+3Cd+qVam5lbsfpuAgrx8onST/YEBMoXDthRaEEN/lTk5Meo60GjAmgpOndnDEM7IQQrAuDwg
	QpLxLIE+92LpM7uWpz3OwA7wx1JtMMjjKEGg==
X-Received: by 2002:a25:9b43:0:b0:df4:db5c:99f4 with SMTP id 3f1490d57ef6-dfe68e1035fmr1082303276.53.1718186444902;
        Wed, 12 Jun 2024 03:00:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOktfObDQNKjUKciV5daVONzUhBnYIsNNdzS9wwprWRM1rKMBFoGCm7KQNof1pWXG2QRua8NNQJBM2HCbJiLQ=
X-Received: by 2002:a25:9b43:0:b0:df4:db5c:99f4 with SMTP id
 3f1490d57ef6-dfe68e1035fmr1082268276.53.1718186444117; Wed, 12 Jun 2024
 03:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
In-Reply-To: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 12 Jun 2024 12:00:31 +0200
Message-ID: <CAGxU2F43hwr3pJjS-MdOjyVrZ5tQTG3W==vDTJmgd3YhPKr86Q@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call - June 12th, 2024
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, 
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudio,

On Tue, Jun 11, 2024 at 10:46=E2=80=AFPM Claudio Siqueira de Carvalho
<cclaudio@ibm.com> wrote:
>
> Hi,
>
> I would like to add two topics to the SVSM meeting agenda:

I won't be able to participate in today's call because I'm on my way
to Brno for DevConf, so I post a few thoughts below.

>
> - What does TPM locality[1] mean for the SVSM vTPM?

Interesting, IIUC an example could be to use different "localities"
for SVSM itself, edk2, kernel, etc.  right ?

> - Is there any SVSM boot event that we want to record in the TPM PCRs/Eve=
nt log?
> E.g. a SVSM configuration, the OVMF hash, etc

Talking with Daniel, it seems that now EDK2 is self-measuring itself
in PCR0, so maybe it would be better to do this in SVSM.
So it would be nice to have SVSM measuring itself in PCR0, SVSM
measuring EDK2 in PCR0, and EDK2 stopping doing it.

Obviously SVSM and EDK2 are already measured by the SNP attestation
report, so it's not a blocking thing for now, since the guest OS can
use that mechanism to measure them.

Thanks for raising these topics!
Stefano

>
> [1]
> https://trustedcomputinggroup.org/wp-content/uploads/PC-Client-Specific-P=
latform-TPM-Profile-for-TPM-2p0-v1p05p_r14_pub.pdf
>
> Thanks,
> Claudio
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
>

