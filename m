Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAC11F163
	for <linux-coco@lists.linux.dev>; Thu, 13 Jul 2023 15:56:51 +0000 (UTC)
Received: from 8bytes.org (pd9fe94eb.dip0.t-ipconnect.de [217.254.148.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B01B828012A;
	Thu, 13 Jul 2023 17:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1689263424;
	bh=OLJU3SR6cRiJ6OsOAtXZ0G0weObZUi+vKis4ETdMDq8=;
	h=Date:From:To:Cc:Subject:From;
	b=B4SXyn6rxFd9d9kM1MadPeDKBKhPsBYAaoYXWfrO24UOMnxYJZSd/JdEWiVrU9STk
	 TQWp1IETI7NzkBQUbpqMHlVfoLmfcvfm9HQuBoWWER/Or3nOyDgjZPsDDtQVuBGgFl
	 vlcNpvTH8qWvk6rQUTSeb42TMNSFpH2w5Uo84C21EMvqYgZJFZ2RU9wAXZ3oJsEKnr
	 OxW6kfRZ5/jzZ9q950rQO7Cmr1e95nwjWl9NzxJc490KUryPqLUDT7sNZZ2Pxdo+dk
	 RcWLY9RE6euw49DkQc7eRezkLnh5Mvgc0yyCTDgemVYtQwZ/JOfvLxpoXOygfBdrTm
	 z2a7cX+z2BGEg==
Date: Thu, 13 Jul 2023 17:50:23 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-sgx@vger.kernel.org
Cc: Dhaval Giani <dhaval.giani@gmail.com>
Subject: [CfP] Confidential Computing Microconference @ LPC 2023
Message-ID: <ZLAdPyqn8glGgYjT@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

We are pleased to announce the call for presentations for this years
Confidential Computing MC at the Linux Plumbers Conference.

In this microconference we want to discuss ongoing developments around
Linux support for memory encryption and support for confidential
computing in general.

Topics of interest include:

	* Support for unaccepted memory

	* Attestation workflows

	* Confidential Computing threat model

	* Secure VM Service module (SVSM) and paravisor architecture and implementation

	* Live migration of confidential virtual machines

	* ARM64 Confidential Computing

	* RISC-V CoVE

	* Secure IO and device attestation

	* Intel TDX Connect

	* AMD SEV-TIO

Please use the LPC CfP process to submit your proposals. Submissions can
be made via

	https://lpc.events/event/17/abstracts/

Make sure to select "Confidential Computing MC" as the track and submit
your session proposal by August 25th. Submissions made after that date
can not be included into the microconference.

Looking forward to seeing all of you in Richmond, Virginia in November!

Thanks,

	Joerg

