Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46B10FF
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1691531167;
	bh=gt/XLLttdSccDuzrhBiSfOpn3inR4DFSTkwIZfiJOzM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=elFwTApfQl5Hz+Qi4iIgrBfy+8K06zHvLBhoOSxTa3q5biqcLR6/Yax59vRXymYPe
	 aecrlWRMxPHQXFysnBL4Ky+jvOxWnO15e5h0Eu+3eVSZS1TMu0NDuqJ1tVkOH5znnu
	 YgEQDCbVecEEXLFECnelZKimtp6qFkqs6ER8MYP4=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7872D12811F6;
	Tue,  8 Aug 2023 17:46:07 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id np-Ge4hFaRbN; Tue,  8 Aug 2023 17:46:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1691531167;
	bh=gt/XLLttdSccDuzrhBiSfOpn3inR4DFSTkwIZfiJOzM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=elFwTApfQl5Hz+Qi4iIgrBfy+8K06zHvLBhoOSxTa3q5biqcLR6/Yax59vRXymYPe
	 aecrlWRMxPHQXFysnBL4Ky+jvOxWnO15e5h0Eu+3eVSZS1TMu0NDuqJ1tVkOH5znnu
	 YgEQDCbVecEEXLFECnelZKimtp6qFkqs6ER8MYP4=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E20761280F38;
	Tue,  8 Aug 2023 17:46:05 -0400 (EDT)
Message-ID: <3ff1bee6d121ce76fd78217dbe3e5ab2f0134f54.camel@HansenPartnership.com>
Subject: Re: [PATCH 0/4] keys: Introduce a keys frontend for attestation
 reports
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Sathyanarayanan Kuppuswamy
 <sathyanarayanan.kuppuswamy@linux.intel.com>, dhowells@redhat.com, Brijesh
 Singh <brijesh.singh@amd.com>, Peter Zijlstra <peterz@infradead.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, Jarkko
 Sakkinen <jarkko@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>,  linux-coco@lists.linux.dev,
 keyrings@vger.kernel.org, x86@kernel.org,  linux-kernel@vger.kernel.org
Date: Tue, 08 Aug 2023 17:46:04 -0400
In-Reply-To: <CAAH4kHYLPP5ehLBDkXxJQmnuFTjjRp+1tON5T9HqSxCvD1mSxA@mail.gmail.com>
References: 
	<169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
	 <a507ef3302d3afff58d82528ee17e82df1f21de0.camel@HansenPartnership.com>
	 <64c5ed6eb4ca1_a88b2942a@dwillia2-xfh.jf.intel.com.notmuch>
	 <c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com>
	 <64cdb5f25c56_2138e294f1@dwillia2-xfh.jf.intel.com.notmuch>
	 <1180481830431165d49c5e64b92b81c396ebc9b1.camel@HansenPartnership.com>
	 <64d17f5728fbc_5ea6e2943f@dwillia2-xfh.jf.intel.com.notmuch>
	 <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
	 <2425e00b-defb-c12b-03e5-c3d23b30be01@linux.intel.com>
	 <64d263e44e401_2138e29486@dwillia2-xfh.jf.intel.com.notmuch>
	 <CAAH4kHamob7g_+BRd0JW76cM7_vS=jzXzRjrgCPDxZ29VnzdCQ@mail.gmail.com>
	 <f95d75c513c081d5bb8b5d1fd3b0a5d5e24ab467.camel@HansenPartnership.com>
	 <CAAH4kHYJrKPgWXn7+G_sZXoAs8fq2sDEyT-tyECPthdaaoXyDw@mail.gmail.com>
	 <9c9c62f9243595a1faa3b0745fa8a1f8f018d9b8.camel@HansenPartnership.com>
	 <CAAH4kHYLPP5ehLBDkXxJQmnuFTjjRp+1tON5T9HqSxCvD1mSxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2023-08-08 at 13:04 -0700, Dionna Amalie Glaze wrote:
> > Trusting the vTPM is a one time thing.  Once trust in the TPM is
> > established, you don't need to be worried about replay and you can
> > just use standard TPM primitives for everything onward, even when
> > doing point in time runtime attestation.
> > 
> 
> It's a one time thing for who?

Well, in TLS-TPM it tends to be a one time thing per endpoint
regardless of number of connections.

>  It seems like you're still only looking at the 1. use case and not
> the 2. use case. Every different person establishing a connection
> with the service will need to independently establish trust in the
> TPM.

For an ephemeral TPM, the EK should be guaranteed to be random and
therefore non repeating, so there's not much need for the nonce to add
non-repeatability.  So, in theory, the vTPM/EK binding can be published
once and relied on even for multiple different tenant endpoints, sort
of like the EK cert for a physical TPM.

James

