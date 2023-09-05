Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49A72571
	for <linux-coco@lists.linux.dev>; Tue,  5 Sep 2023 15:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDD0C433C7;
	Tue,  5 Sep 2023 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693928158;
	bh=HhutMdt2v5Oki0P48G/qsRslHHu4n9/C6rU4c5lQPF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZK4rowOGG36y5OaIXHz+jzU+hbwuvGaYnlT1Sajgc5MvOBCVSewDT3a3Z9l+Pwono
	 Vt8WrRMYDKeyJHM7qReP9CQgV6hKlFV2ToOJ+6sofyvhfMW3eVLdA4Rirmv9kzWbx5
	 FCVdM3HW5konCPFglqEIVkg4L8z7CfZY9+vbdCvk=
Date: Tue, 5 Sep 2023 16:35:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ardb@kernel.org, kraxel@redhat.com, dovmurik@linux.ibm.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	Dhaval.Giani@amd.com, michael.day@amd.com,
	pavankumar.paluri@amd.com, David.Kaplan@amd.com, Reshma.Lal@amd.com,
	Jeremy.Powell@amd.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alexander.shishkin@linux.intel.com, thomas.lendacky@amd.com,
	tglx@linutronix.de, dgilbert@redhat.com, dinechin@redhat.com,
	linux-coco@lists.linux.dev, berrange@redhat.com, mst@redhat.com,
	tytso@mit.edu, jikos@kernel.org, joro@8bytes.org, leon@kernel.org,
	richard.weinberger@gmail.com, lukas@wunner.de, jejb@linux.ibm.com,
	cdupontd@redhat.com, jasowang@redhat.com, sameo@rivosinc.com,
	bp@alien8.de, seanjc@google.com, security@kernel.org,
	Larry Dewey <larry.dewey@amd.com>
Subject: Re: [PATCH v4] docs: security: Confidential computing intro and
 threat model for x86 virtualization
Message-ID: <2023090538-apprehend-wind-8b1d@gregkh>
References: <20230905152656.1215119-1-carlos.bilbao@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905152656.1215119-1-carlos.bilbao@amd.com>

On Tue, Sep 05, 2023 at 10:26:56AM -0500, Carlos Bilbao wrote:
> Kernel developers working on confidential computing for virtualized
> environments in x86 operate under a set of assumptions regarding the Linux
> kernel threat model that differs from the traditional view. Historically,
> the Linux threat model acknowledges attackers residing in userspace, as
> well as a limited set of external attackers that are able to interact with
> the kernel through networking or limited HW-specific exposed interfaces
> (e.g. USB, thunderbolt). The goal of this document is to explain additional
> attack vectors that arise in the virtualized confidential computing space.
> 
> Reviewed-by: Larry Dewey <larry.dewey@amd.com>
> Reviewed-by: David Kaplan <david.kaplan@amd.com>
> Co-developed-by: Elena Reshetova <elena.reshetova@intel.com>
> Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
> 
> ---
> V3 can be found in:
> https://lwn.net/Articles/937927/

That's not a lore.kernel.org link :)

