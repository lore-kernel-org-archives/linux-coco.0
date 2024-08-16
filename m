Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9CE2BB0D
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723824851; cv=none; b=b3bJBF01m7Gd+LuYjsb5BVofevXBeoxyJvDiGsY57WvvKwp/oDXt7zPDkW2v3o9yztezfV+2YxMO0tsJVK1urAIfylDxnSz2+TMr3q6b6vhbamPwQtGtjM7/B984khE9/ahKknsgILRS04iy5AR6op3fMPdNMSaQVgekkUVnOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723824851; c=relaxed/simple;
	bh=cLsbvnBriQrMPr66bR+6PZjFOAgEDYZ0NkFAiqCbHv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMmu6b0jBcExIbpvRwAEJDfiPd28j7xjAFhjZu2JDDzm0fjmOQaRv/ZMB8lEoxojVkHEalV/B0nK/im9B8IFhZfRGPoPlvmZnCu/VOnmhjqZNcOLa0HwELrOrh5ylmt1HjZqTgAVhkGVtVBobSAmC+0dMh8KSNOeFHsuvCtXTdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=277MxH+I; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="277MxH+I"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a80eab3945eso245557866b.1
        for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723824848; x=1724429648; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLsbvnBriQrMPr66bR+6PZjFOAgEDYZ0NkFAiqCbHv8=;
        b=277MxH+IMPeXkbMq15J8P4UDmTfLsyhJ3lkjj0/V5Qo/4gXn4z+q03TsKyb36RqamI
         QB2a3rB/zhcI6bcSKY5BJ6xqVWovm4wj0aXhEFLpaGitZUjbQpwNev5ZO1/7T+694RkO
         79M0YWOVn64nw7u4Fqzf1FjknfSbYBSJAtYH1ijZZd+Y8OsaeMQ7qe2rfbfBzJx+8zhk
         qIL0wpWD6mwBDwK9t0hf4ao5TatJnnjwv+qgpFChiscqt2mwjaDIBctG6x21eIBk2oVH
         m3GvQpwpQ1krAVaWP+BMtqZrNNCVmscjgBpCehLTLnY9KQSxN/ke22S04O01E2DM0MWK
         6UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723824848; x=1724429648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLsbvnBriQrMPr66bR+6PZjFOAgEDYZ0NkFAiqCbHv8=;
        b=UeK3ENG7uB6BPAl3LaIf7jHWlvTDPnDk8npjhNq+v05hsjzV5PwKPW3/UwrFfNhVOW
         aBLPRisyThbGoGlB6NHtKWJpJQDYLms9bBLXsA2g6N0byoClhNxdDOK5XfUsxBobJ6xx
         DpQ/1Nqg7S2uI+Z+LwMriy+Hdav3mEzVn7ERd9ib3o6DH2BXD/UTzp9HniMIlhQvXKSn
         1Gbt3X1YOOCFhAGcfU9nEdyHaN5OBAX/9OLIT2AiRuGRUqZ0g+Ay3U8plRTMInuk4grV
         G8u13DCCSEWd/Yt3FQo0zhqvBI+FUzB8pu5en/25dg+qDpdfPqL4aFxtdEBPCqhyPrAv
         2IOA==
X-Forwarded-Encrypted: i=1; AJvYcCUwjO0jwABjtHrYJglcEeQxWxj9YdqccyvUBZbN28PZ/prnb43CFwm3qYEuxqtrW0AzJ4ddVF6BL9N2htln6IAM+FBbL4fASh8cwg==
X-Gm-Message-State: AOJu0Yx0ptXkR3NAny0Dq30BpQpLvYFQOnQdBrUkKSYpiRyXHkiSpnRb
	nKJ9rmNRFQ4khdFBKaRrJuuvE4RLDP/3BlmMKxKkAuU6L6k+SMIj5frcDpJ99q9WRORPxsPRdZD
	MmN1ZPWPZ6Ty0PNT9DB0+MR2bLfqvze96bAHj
X-Google-Smtp-Source: AGHT+IH+16EpsIq6phBnG7MyjVSPO6Rwn1YDSKcUzwbMELznLfJJdf2PRUXRUtMTOm1Yu45OuXR+BMVskZIfXF3WIi0=
X-Received: by 2002:a17:907:c7c5:b0:a7d:26ff:aeb0 with SMTP id
 a640c23a62f3a-a8392952665mr246673566b.30.1723824847854; Fri, 16 Aug 2024
 09:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
 <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
 <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
 <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
 <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <003d1f1d654525afc736d84ec9a9e22debde1785.camel@ibm.com> <ead3a13611e209bd994ca688e5ab0a9fa309383a.camel@HansenPartnership.com>
 <DM8PR11MB5750F26CA8292B1053722E10E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
 <f3de5c989f718ba999d4c3b00ffc6a06a1898c6c.camel@HansenPartnership.com>
 <DM8PR11MB575007C975ABEFED36C8D027E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
 <MW4PR11MB5872C42AA225F66AC0F845928C812@MW4PR11MB5872.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB5872C42AA225F66AC0F845928C812@MW4PR11MB5872.namprd11.prod.outlook.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 16 Aug 2024 09:13:55 -0700
Message-ID: <CAAH4kHYSf_jEKV6uFVBViCYtpLYCXe0S_zF6=+NHzeFRKc+g-Q@mail.gmail.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
To: "Yao, Jiewen" <jiewen.yao@intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, 
	"jroedel@suse.com" <jroedel@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, 
	"jpiotrowski@linux.microsoft.com" <jpiotrowski@linux.microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, 
	"Perez, Ronald" <ronald.perez@intel.com>, "Lange, Jon" <jlange@microsoft.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Johnson, Simon P" <simon.p.johnson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 8:38=E2=80=AFPM Yao, Jiewen <jiewen.yao@intel.com> =
wrote:
>
> Yes, current intel TDP vTPM design only covers ephemeral vTPM solution. I=
t is a known limitation.
>
> I remember we have discussed persistent vTPM before, but we defer it beca=
use of complexity.
>
> Is there a full persistent vTPM design ready in coconut-svsm now? E.g. ho=
w to protect the vTPM persistent NVS?
>
>

The design is ongoing in the early attestation document [1]. I
honestly don't think it can fully protect mutable NVS without
significant TCB increase since avoiding monotonic counter duplication
and rollback is hard. We can certainly persist an EK and SRK on first
boot and provision a sealing key for the NVS that's released with
early attestation, but that buys you... literally nothing? over the
evTPM solution of instead releasing the persistent SRK to the evTPM on
boot with early attestation. The EK would mean a "persistent
identity", but the way that you name the key to release is still going
to be a platform-controlled aspect. You can't avoid it. So just allow
your platform to sign an ephemeral EKpub cert with x509 extensions
that include platform identity information. That's more valuable,
since then you have a persistent identity that is backed by a
platform-held secret.

The EKpub cert is expected to be "signed" by the hardware attestation
to tie it back to the TEE, so I'm not sure even persisting the EK is
good from a security perspective since the certificate would have a
really old quote with no way to challenge it again. It might not be
best practice to make an ephemeral EKpub cert unchallengable, but at
least we can't find a flaw in it.

All this said, I think early attestation releasing some kind of key to
get access to some encrypted persisted blob is a common need between
evTPM full disk encryption support and persistent vTPM. We can execute
towards a standard pstore virtual device (virtio-blk?) to import a
sealed blob, and a standard network proxy device (virtio-vsock?) to
import a wrapped SRK from a key management service that has an
attestation verification policy protecting release.

[1] https://docs.google.com/document/d/11ZsxP8jsviP3ddp9Hrn0rf6inttNw_Pbnz0=
psXlxlPs/edit#heading=3Dh.7jvpsq5illyd

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
