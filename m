Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04430644
	for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 06:54:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D9E2C68BEB; Mon, 30 Jan 2023 07:54:37 +0100 (CET)
Date: Mon, 30 Jan 2023 07:54:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Guorui Yu <GuoRui.Yu@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	konrad.wilk@oracle.com, linux-coco@lists.linux.dev, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com
Subject: Re: [RFC] swiotlb: Add a new cc-swiotlb implementation for
 Confidential VMs
Message-ID: <20230130065437.GA32108@lst.de>
References: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com> <f9de1d58-a723-5791-605a-a0d4a024e3ad@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9de1d58-a723-5791-605a-a0d4a024e3ad@linux.alibaba.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Just as the last time around:  stop duplicating code pointlessly.  NAK.

