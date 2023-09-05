Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975FD531
	for <linux-coco@lists.linux.dev>; Tue,  5 Sep 2023 15:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2168EC433C8;
	Tue,  5 Sep 2023 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693928361;
	bh=IuTYB1prDBGGRSQfQarq/IhVRw5br9ovPsUKvnjcSZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4Ub3csFSLuOvbcPvtEMyLZRqCkHa6DHUH193SdWA9d0qkRP0W2ykfArYwwxCJLpy
	 n233eB2R8FTuUFTaCb9H8ls3I0lXdM4kbq18lOQ3vMpeKRfFKir1EqOkG0lfEjC3we
	 C+uIX29aOPcPfYPe+FYj13lBBz87ABqScFvdAlh4=
Date: Tue, 5 Sep 2023 16:39:18 +0100
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
Message-ID: <2023090555-gossip-neon-9f66@gregkh>
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
> +The basic CoCo guest layout includes the host, guest, the interfaces that
> +communicate guest and host, a platform capable of supporting CoCo VMs, and

"communicate between the guest and host" right?

