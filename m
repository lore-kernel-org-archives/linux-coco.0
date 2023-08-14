Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD99C140
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 18:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003B4C433C8;
	Mon, 14 Aug 2023 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692038612;
	bh=CEDtxHzewvNP/uVLV4uDBvWZBs5jA5ucEbHtniMYaqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkpRB+FqHK9b/sPQmPhA8AVKEJRLDRF6v6MYb/Efe+JkxkaS6NDKp7bD0dJV5yCPH
	 +a2eY3iDgBP2ZQap6sa2k1fZmG16e8uQjHbE9xCNn/9yhqE91rYfffRiy6UmLKO/IK
	 cL1zKiuTOGepZzqIGXAUZhhIcVkNRoS98l82ata8=
Date: Mon, 14 Aug 2023 20:43:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Gonda <pgonda@google.com>, Samuel Ortiz <sameo@rivosinc.com>,
	peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] tsm: Introduce a shared ABI for attestation
 reports
Message-ID: <2023081454-mortify-unopened-5b71@gregkh>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199900110.1782217.12112722316618515086.stgit@dwillia2-xfh.jf.intel.com>
 <2023081432-evade-proofing-fb8c@gregkh>
 <64da59b9924d2_2138e2947f@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64da59b9924d2_2138e2947f@dwillia2-xfh.jf.intel.com.notmuch>

On Mon, Aug 14, 2023 at 09:43:37AM -0700, Dan Williams wrote:
> Greg Kroah-Hartman wrote:
> > On Mon, Aug 14, 2023 at 12:43:21AM -0700, Dan Williams wrote:
> > > One of the common operations of a TSM (Trusted Security Module) is to
> > > provide a way for a TVM (confidential computing guest execution
> > > environment) to take a measurement of its launch state, sign it and
> > > submit it to a verifying party. Upon successful attestation that
> > > verifies the integrity of the TVM additional secrets may be deployed.
> > > The concept is common across TSMs, but the implementations are
> > > unfortunately vendor specific. While the industry grapples with a common
> > > definition of this attestation format [1], Linux need not make this
> > > problem worse by defining a new ABI per TSM that wants to perform a
> > > similar operation. The current momentum has been to invent new ioctl-ABI
> > > per TSM per function which at best is an abdication of the kernel's
> > > responsibility to make common infrastructure concepts share common ABI.
> > > 
> > > The proposal, targeted to conceptually work with TDX, SEV, COVE if not
> > > more, is to define a sysfs interface to retrieve the TSM-specific blob.
> > > 
> > >     echo $hex_encoded_userdata_plus_nonce > /sys/class/tsm/tsm0/inhex
> > >     hexdump /sys/class/tsm/tsm0/outblob
> > 
> > Why is one way a hex-encode file, that the kernel has to parse, and the
> > other not?  Binary sysfs files should be "pass through" if at all
> > possible, why not make them both binary and not mess with hex at all?
> > That keeps the kernel simpler, and if userspace wants the hex format,
> > they can provide it much easier (with less potential parsing errors).
> 
> I can do that. The concern was the contract around what to do with
> partial writes since binary attributes allow writing the middle of the
> buffer. So either the attribute needs to enforce that @offset is always
> zero, or that the unwritten portion of the buffer is zeroed. I will go
> with just enforcing offset=zero writes.

Enforcing that sounds sane, thanks.

greg k-h
