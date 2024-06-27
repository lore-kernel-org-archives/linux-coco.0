Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6BB1991A9
	for <linux-coco@lists.linux.dev>; Thu, 27 Jun 2024 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719505408; cv=none; b=U/OsW5Y9NVLuViAXBq9eIh1peGbtnDGukEbGMUBxBFXDaBvRhQvTbkN6jjF1nb692LqIAhmv3XZEy5LPYiehkp28SgEgLS5h1aveld44DMMMtx4qisBDvJPatSelxBt4ih9GPExT1jRxFWnVSepoCTwQpI3Rt2WgAkaxi4UY2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719505408; c=relaxed/simple;
	bh=aY2PaVLVAy4wf9fthQf4/bjN+kKjwYAjEWn7CBsi+Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuDi0zE9VxXhZT2D1UI/0rso3OloxKjsmNh5CTfl0WPcTpdISQRqY1JLjeQPQ0Ro93K0xPogUV2LqSXL8uYCFMgyfa50OFzJzK1LGTN12+S+A6AJbQlhwDu6cDmqjqatSd0rFkwTNsCRZPT22ZOdwas8KuqCoyhPEI3W1Lsf9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWbvS+El; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWbvS+El"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-424786e4056so67035e9.0
        for <linux-coco@lists.linux.dev>; Thu, 27 Jun 2024 09:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719505404; x=1720110204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k1lfarqt/tldAQI4sIeBi43+DAejgtVN0jX6gZpQ8M=;
        b=PWbvS+El1ubUWeHpX3ePXKnohdV76vzclEUrufqIF4JaLwtyNBX8z5Clid3FgX/Gga
         WpkOnKLucN/6rdqy7o1chYCoueOpvAAVvHVxrkkPXCZcpYN6jt2fJ5NnF5AiKxqXh2Ru
         K8r4lGZdms528y5lk4M9DIFymBEqoJP/BHrFEiqqWqeZiEob3H94bYsuA3iKSXcZ0xYB
         b3RkZ7LPC69jThF7vBKZ3XRFnB92y7lXmDeVXAev7octlBmBvo/ky7b/ps8935DUve/f
         JF33EvRgJM1dFzScF0r8Tf6fNM3vXgrJqK2RQyBy81RaNQSS5yWKLRVYBTfQM9AJSI/5
         aFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719505404; x=1720110204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2k1lfarqt/tldAQI4sIeBi43+DAejgtVN0jX6gZpQ8M=;
        b=e9CUCr5vAltuTiwizjGstsQpRkVhTyd7qeV3OZ/q5a0FRdRYx7EvIcga4mbOL2rDpD
         SUbEPPfvC3neQ+3bvQqC8udaQliKZXpa7OcqPi660wXAGz1mk83ouY1epXexU3qkwb7p
         NU7f5eY05XyuuioDAg0ydV0bzi3LFCZyTamHh7qp3u1lBo+uuIFpuzZPdrHkFwcSTm3F
         ZvIt6Nj+lB8obTtIcE8vGk+ZKKDIzCNTMvUO2uxetGs5IZEDgf/mpxJR1xLCi9vXsQ64
         m/r3wPze/JEFN7bINAN8fc+xuDGc9XC4hzEjtJJcT0pljb9uIzvBSlK2I7HFKhXa2E6A
         3Rfg==
X-Forwarded-Encrypted: i=1; AJvYcCVpgIO9gBn94oRNwXu+tm5ns1+fQdPJrgbfPbg3Ar9XySu9v0fR4Ux5YHMgu62YN58WxLUfKZqse3++nHmhVndKFGbjI2sMDPyyPQ==
X-Gm-Message-State: AOJu0YxppMYaSp3fCiRWaokbTUD6h3L0Yu/Qs+q5KJxXjtL/mtIChAcZ
	nRUZPAnKzJT9jK4L+S7RfDF3jxjtrr6coVuWKghcimUA7yL5UT7gk2+G3yXemcYzy85B6UB6qYs
	L2l1t9cFR0HnqhKtT0jX+KLEK9Fp+V/22Hh5h
X-Google-Smtp-Source: AGHT+IEsR7hWdnLYCcHuX2KdrH9UT2/vT8sYfMsLAaF2r+ttgkzQJ4oIzIQvUcsXUenQtr1IzbX9gj8YsYzTxP06zIA=
X-Received: by 2002:a05:600c:4f42:b0:424:a58e:31ff with SMTP id
 5b1f17b1804b1-42563ae477amr2177105e9.0.1719505404347; Thu, 27 Jun 2024
 09:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-2-michael.roth@amd.com> <ZnwecZ5SZ8MrTRRT@google.com>
 <6sczq2nmoefcociyffssdtoav2zjtuenzmhybgdtqyyvk5zps6@nnkw2u74j7pu>
 <ZnxMSEVR_2NRKMRy@google.com> <fbzi5bals5rmva3efgdpnljsfzdbehg4akwli7b5io7kqs3ikw@qfpdpxfec7ks>
 <ZnxyAWmKIu680R_5@google.com> <87320ee5-8a66-6437-8c91-c6de1b7d80c1@amd.com> <Zn2GpHFZkXciuJOw@google.com>
In-Reply-To: <Zn2GpHFZkXciuJOw@google.com>
From: Peter Gonda <pgonda@google.com>
Date: Thu, 27 Jun 2024 10:23:12 -0600
Message-ID: <CAMkAt6pDVEk1rBKdpgif3geied3tc67GquJrqtBA+RsK+aaNoA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
To: Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	pbonzini@redhat.com, jroedel@suse.de, ashish.kalra@amd.com, bp@alien8.de, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 9:35=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Jun 27, 2024, Tom Lendacky wrote:
> > On 6/26/24 14:54, Sean Christopherson wrote:
> > > On Wed, Jun 26, 2024, Michael Roth wrote:
> > >>> What about the host kernel though?  I don't see anything here that =
ensures resp_pfn
> > >>> isn't "regular" memory, i.e. that ensure the page isn't being concu=
rrently accessed
> > >>> by the host kernel (or some other userspace process).
> > >>>
> > >>> Or is the "private" memory still accessible by the host?
> > >>
> > >> It's accessible, but it is immutable according to RMP table, so so i=
t would
> > >> require KVM to be elsewhere doing a write to the page,
> > >
> > > I take it "immutable" means "read-only"?  If so, it would be super he=
lpful to
> > > document that in the APM.  I assumed "immutable" only meant that the =
RMP entry
> > > itself is immutable, and that Assigned=3DAMD-SP is what prevented hos=
t accesses.
> >
> > Not quite. It depends on the page state associated with the page. For
> > example, Hypervisor-Fixed pages have the immutable bit set, but can be
> > read and written.
> >
> > The page states are documented in the SNP API (Chapter 5, Page
> > Management):
>
> Heh, but then that section says:
>
>   Pages in the Firmware state are owned by the firmware. Because the RMP.=
Immutable
>                                                          ^^^^^^^^^^^^^^^^=
^^^^^^^^^
>   bit is set, the hypervisor cannot write to Firmware pages nor alter the=
 RMP entry
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   with the RMPUPDATE instruction.
>
> which to me very clearly suggests that the RMP.Immutable bit is what make=
s the
> page read-only.
>
> Can you ask^Wbribe someone to add a "Table 11. Page State Properties" or =
something?
> E.g. to explicitly list out the read vs. write protections and the state =
of the
> page's data (encrypted, integrity-protected, zeroed?, etc).  I've read th=
rough
> all of "5.2 Page States" and genuinely have no clue as to what protection=
s most
> of the states have.
>
> Ah, never mind, I found "Table 15-39. RMP Memory Access Checks" in the AP=
M.  FWIW,
> that somewhat contradicts this blurb from the SNP ABI spec:
>
>   The content of a Context page is encrypted and integrity protected so t=
hat the
>   hypervisor cannot read or write to it.
>
> I also find that statement confusing.  IIUC, the fact that the Context pa=
ge is
> encrypted and integrity protected doesn't actually have anything to do wi=
th the
> host's ability to access the data.  The host _can_ read the data, but it =
will get
> ciphertext.  But the host can't write the data because the page isn't HV-=
owned.
>
> Actually, isn't the intregrity protected part wrong?  I thought one of th=
e benefits
> of SNP vs. ES is that the RMP means the VMSA doesn't have to be integrity=
 protected,
> and so VMRUN and #VMEXIT transitions are faster because the CPU doesn't n=
eed to do
> as much work.

The statement is fairly vague so its a bit confusing that the
encryption scheme on the Context page doesn't include integrity. In
reality the encryption is AES-XTS with a physical address tweak so no
integrity. The integrity comes purely from the RMP with SNP, but it's
still integrity protected right? So I don't think that part is wrong.
